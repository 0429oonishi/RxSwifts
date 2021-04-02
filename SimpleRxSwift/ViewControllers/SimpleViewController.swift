//
//  SimpleViewController.swift
//  SimpleRxSwift
//
//  Created by 大西玲音 on 2021/04/02.
//

import UIKit

final class SimpleViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func loginButtonDidTapped(_ sender: Any) {
        label.text = "login"
    }
    
    @IBAction private func messageButtonDidTapped(_ sender: Any) {
        label.text = "message"
    }
    
    @IBAction private func logoutButtonDidTapped(_ sender: Any) {
        label.text = "logout"
    }
    
    @IBAction private func backButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
