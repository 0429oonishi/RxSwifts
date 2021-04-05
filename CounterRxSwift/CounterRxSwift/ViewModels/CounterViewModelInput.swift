//
//  CounterViewModelInput.swift
//  CounterRxSwift
//
//  Created by 大西玲音 on 2021/04/05.
//

import RxSwift
import RxCocoa

protocol CounterViewModelOutput {
    var counterText: Driver<String?> { get }
}

struct CounterViewModelInput {
    let countUpButton: Observable<Void>
    let countDownButton: Observable<Void>
    let countResetButton: Observable<Void>
}

protocol CounterViewModelType {
    var outputs: CounterViewModelOutput? { get }
    func setup(input: CounterViewModelInput)
}

