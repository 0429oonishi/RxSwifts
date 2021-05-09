//
//  AddTaskViewController.swift
//  FilteringOperatorsRxSwiftToDoApp
//
//  Created by 大西玲音 on 2021/05/09.
//

import UIKit
import RxSwift
import RxCocoa

final class AddTaskViewController: UIViewController {
    
    @IBOutlet private weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet private weak var titleTextField: UITextField!
    
    private let taskSubject = PublishSubject<Task>()
    // 外部からイベントを流せないようにObservableにして、それを呼び出し側で購読する
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObserver()
    }
    
    @IBAction private func saveButtonDidTapped(_ sender: Any) {
        guard let priority = Priority(rawValue: prioritySegmentedControl.selectedSegmentIndex),
              let title = titleTextField.text else { return }
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)
        dismiss(animated: true, completion: nil)
    }
    
}
