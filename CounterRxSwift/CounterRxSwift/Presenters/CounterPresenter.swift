//
//  CounterPresenter.swift
//  CounterRxSwift
//
//  Created by 大西玲音 on 2021/04/05.
//

protocol CounterDelegate: class {
    func updateCount(count: Int)
}

class CounterPresenter {

    private weak var delegate: CounterDelegate?
    private var count = 0 {
        didSet {
            delegate?.updateCount(count: count)
        }
    }
    
    func attachView(_ delegate: CounterDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func incrementCount() {
        count += 1
    }
    
    func decrementCount() {
        count -= 1
    }
    
    func resetCount() {
        count = 0
    }
    
}
