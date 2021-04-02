//
//  RxSimpleViewController.swift
//  SimpleRxSwift
//
//  Created by 大西玲音 on 2021/04/02.
//

import UIKit
import RxSwift
import RxCocoa

final class RxSimpleViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var messageButton: UIButton!
    @IBOutlet private weak var logoutButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.label.text = "login"
            })
            .disposed(by: disposeBag)
        
        messageButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.label.text = "message"
            })
            .disposed(by: disposeBag)
        
        logoutButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.label.text = "logout"
            })
            .disposed(by: disposeBag)
        
        backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
    }
    
}
