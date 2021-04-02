//
//  ExampleViewController.swift
//  ExampleRxSwift
//
//  Created by 大西玲音 on 2021/04/03.
//

import UIKit

final class ExampleViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressTextField: UITextField!
    @IBOutlet private weak var addressLabel: UILabel!
    
    private let maxNameTextFieldSize = 10
    private let maxAddressTextFieldSize = 50
    private let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.addTarget(self,
                                action: #selector(nameTextFieldEditingChanged(sender:)),
                                for: .editingChanged)
        
        addressTextField.addTarget(self,
                                   action: #selector(addressTextFieldEditingChanged(sender:)),
                                   for: .editingChanged)
        
    }
    
    @objc func nameTextFieldEditingChanged(sender: UITextField) {
        guard let changedText = sender.text else { return }
        let limitCount = maxNameTextFieldSize - changedText.count
        nameLabel.text = limitText(limitCount)
    }
    
    @objc func addressTextFieldEditingChanged(sender: UITextField) {
        guard let changedText = sender.text else { return }
        let limitCount = maxAddressTextFieldSize - changedText.count
        addressLabel.text = limitText(limitCount)
    }

}

