//
//  ClosureCounterViewModel.swift
//  CounterRxSwift
//
//  Created by 大西玲音 on 2021/04/05.
//

class ClosureCounterViewModel {
    
    private(set) var count = 0
    
    func incrementCount(closure: (Int) -> Void) {
        count += 1
        closure(count)
    }
    
    func decrementCount(closure: (Int) -> Void) {
        count -= 1
        closure(count)
    }
    
    func resetCount(closure: (Int) -> Void) {
        count = 0
        closure(count)
    }
}

