//
//  RxExampleViewController.swift
//  ExampleRxSwift
//
//  Created by 大西玲音 on 2021/04/03.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

final class RxExampleViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressTextFiled: UITextField!
    @IBOutlet private weak var addressLabel: UILabel!
    
    private let maxNameTextFieldSize = 10
    private let maxAddressTextFieldSize = 50
    private let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.rx.text
            .map { [weak self] text -> String? in
                guard let text = text else { return nil }
                guard let maxNameTextFieldSize = self?.maxNameTextFieldSize else { return nil }
                let limitCount = maxNameTextFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        addressTextFiled.rx.text
            .map { [weak self] text -> String? in
                guard let text = text else { return nil }
                guard let maxAddressTextFieldSize = self?.maxAddressTextFieldSize else { return nil }
                let limitCount = maxAddressTextFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: addressLabel.rx.text)
            .disposed(by: disposeBag)
        
    }

}
