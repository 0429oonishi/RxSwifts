//
//  HelloViewController.swift
//  HelloRxSwift
//
//  Created by 大西玲音 on 2021/04/03.
//

import UIKit
import RxSwift

class HelloRxViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = HelloRxViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.helloWorldObservable
            .subscribe(onNext: { message in
                print("onNext: \(message)")
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: disposeBag)
        
        viewModel.updateItem()
        
    }

}

class HelloRxViewModel {
    
    var helloWorldObservable: Observable<String> {
        return helloWorldSubject.asObservable()
    }
    private let helloWorldSubject = PublishSubject<String>()
    
    func updateItem() {
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onCompleted()
    }
    
}
