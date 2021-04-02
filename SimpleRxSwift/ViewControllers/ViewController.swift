//
//  ViewController.swift
//  SimpleRxSwift
//
//  Created by 大西玲音 on 2021/04/02.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction private func simpleButtonDidTapped(_ sender: Any) {
        let simpleVC = UIStoryboard(name: "Simple", bundle: nil).instantiateViewController(identifier: "SimpleViewController") as! SimpleViewController
        simpleVC.modalPresentationStyle = .fullScreen
        present(simpleVC, animated: true, completion: nil)
    }
    
    @IBAction private func RxSimpleButtonDidTapped(_ sender: Any) {
        let rxSimpleVC = UIStoryboard(name: "RxSimple", bundle: nil).instantiateViewController(identifier: "RxSimpleViewController") as! RxSimpleViewController
        rxSimpleVC.modalPresentationStyle = .fullScreen
        present(rxSimpleVC, animated: true, completion: nil)
    }
    
}

