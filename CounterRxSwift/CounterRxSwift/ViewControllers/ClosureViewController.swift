//
//  ClosureViewController.swift
//  CounterRxSwift
//
//  Created by 大西玲音 on 2021/04/05.
//

import UIKit

class ClosureViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    private var viewModel = ClosureCounterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func countUpButtonDidTapped(_ sender: Any) {
        viewModel.incrementCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    @IBAction func countDownButtonDidTapped(_ sender: Any) {
        viewModel.decrementCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    @IBAction func countResetButtonDidTapped(_ sender: Any) {
        viewModel.resetCount { [weak self] count in
            self?.updateCountLabel(count)
        }
    }
    
    private func updateCountLabel(_ count: Int) {
        countLabel.text = String(count)
    }
    
}
