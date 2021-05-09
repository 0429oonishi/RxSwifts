//
//  TaskListViewController.swift
//  FilteringOperatorsRxSwiftToDoApp
//
//  Created by 大西玲音 on 2021/05/09.
//

import UIKit
import RxSwift
import RxCocoa

final class TaskListViewController: UIViewController {
    
    @IBOutlet private weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
    }
    
    @IBAction private func prioritySegmentedControlDidTapped(_ sender: UISegmentedControl) {
        let priority = Priority(rawValue: sender.selectedSegmentIndex)
        filterTasks(by: priority)
    }
    
    @IBAction private func addButtonDidTapped(_ sender: Any) {
        let addTaskVC = storyboard?.instantiateViewController(identifier: "AddTaskViewController") as! AddTaskViewController
        addTaskVC.taskSubjectObservable
            .subscribe(onNext: { [unowned self] task in
                let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex)
                self.filterTasks(by: priority)
                var existingTasks = self.tasks.value
                existingTasks.append(task)
                self.tasks.accept(existingTasks)
            })
            .disposed(by: disposeBag)
        addTaskVC.modalPresentationStyle = .fullScreen
        present(addTaskVC, animated: true, completion: nil)
    }
    
    private func filterTasks(by priority: Priority?) {
        self.tasks.map { tasks in
            return tasks.filter { $0.priority == priority }
        }.subscribe(onNext: { [weak self] tasks in
            self?.filteredTasks = tasks
            self?.updateTableView()
        }).disposed(by: disposeBag)
    }
    
    private func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDelegate
extension TaskListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

// MARK: - UITableViewDataSource
extension TaskListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath)
        cell.textLabel?.text = filteredTasks[indexPath.row].title
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.textLabel?.font = .boldSystemFont(ofSize: 40)
        return cell
    }
    
}
