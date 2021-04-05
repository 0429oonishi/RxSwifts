//
//  DelegateViewController.swift
//  CounterRxSwift
//
//  Created by 大西玲音 on 2021/04/05.
//

import UIKit

class DelegateViewController: UIViewController {
    
    private let presenter  = CounterPresenter()
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(self)
        
    }
        
    @IBAction func countUpButtonDidTapped(_ sender: Any) {
        presenter.incrementCount()
    }
    
    @IBAction func countDownButtonDidTapped(_ sender: Any) {
        presenter.decrementCount()
    }
    
    @IBAction func countResetButtonDidTapped(_ sender: Any) {
        presenter.resetCount()
    }
    
}

extension DelegateViewController: CounterDelegate {
    
    func updateCount(count: Int) {
        countLabel.text = String(count)
    }
    
}
