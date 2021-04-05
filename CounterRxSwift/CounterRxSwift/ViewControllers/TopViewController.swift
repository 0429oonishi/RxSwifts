//
//  TopViewController.swift
//  CounterRxSwift
//
//  Created by 大西玲音 on 2021/04/05.
//

import UIKit

class TopViewController: UIViewController {

    @IBAction func closureButtonDidTapped(_ sender: Any) {
        let closureViewController = ClosureViewController()
        present(closureViewController, animated: true, completion: nil)
    }
    
    @IBAction func delegateButtonDidTapped(_ sender: Any) {
        let delegateViewController = DelegateViewController()
        present(delegateViewController, animated: true, completion: nil)
    }
    
    @IBAction func rxSwiftButtonDidTapped(_ sender: Any) {
        let rxSwiftViewController = RxSwiftViewController()
        present(rxSwiftViewController, animated: true, completion: nil)
    }
}
