//
//  RxCounterViewModel.swift
//  CounterRxSwift
//
//  Created by 大西玲音 on 2021/04/05.
//

import RxSwift
import RxCocoa

class RxCounterViewModel: CounterViewModelType {
    
    var outputs: CounterViewModelOutput?
    private let countRelay = BehaviorRelay<Int>(value: 0)
    private let initialCount = 0
    private let disposeBag = DisposeBag()
    
    init() {
        self.outputs = self
        resetCount()
    }
    
    func setup(input: CounterViewModelInput) {
        
        input.countUpButton
            .subscribe(onNext: { [weak self] in
                self?.incrementCount()
            })
            .disposed(by: disposeBag)
        
        input.countDownButton
            .subscribe(onNext: { [weak self] in
                self?.decrementCount()
            })
            .disposed(by: disposeBag)
        
        input.countResetButton
            .subscribe(onNext: { [weak self] in
                self?.resetCount()
            })
            .disposed(by: disposeBag)
        
    }
    
    private func incrementCount() {
        let count = countRelay.value + 1
        countRelay.accept(count)
    }
    
    private func decrementCount() {
        let count = countRelay.value - 1
        countRelay.accept(count)
    }
    
    private func resetCount() {
        countRelay.accept(initialCount)
    }
    
}

extension RxCounterViewModel: CounterViewModelOutput {
    
    var counterText: Driver<String?> {
        return countRelay
            .map { String($0) }
            .asDriver(onErrorJustReturn: "")
    }
    
}
