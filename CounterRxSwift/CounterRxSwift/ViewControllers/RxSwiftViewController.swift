//
//  RxSwiftViewController.swift
//  CounterRxSwift
//
//  Created by 大西玲音 on 2021/04/05.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpButton: UIButton!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countResetButton: UIButton!
    
    private let disposeBag = DisposeBag()
    private var viewModel = RxCounterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewModel()
        
    }
    
    private func setupViewModel() {
        let input = CounterViewModelInput(countUpButton: countUpButton.rx.tap.asObservable(),
                                          countDownButton: countDownButton.rx.tap.asObservable(),
                                          countResetButton: countResetButton.rx.tap.asObservable())
        viewModel.setup(input: input)
        viewModel.outputs?.counterText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}
