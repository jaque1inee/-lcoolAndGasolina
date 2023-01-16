//
//  ResultViewController.swift
//  AppAlcool
//
//  Created by Jaqueline Oliveira on 19/12/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultCalculator: String?
    
    var screen: ResultScreen?
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.selectedResultLabel.text = resultCalculator ?? ""
    }
}

extension ResultViewController: ResultDelegate {
    func calculateAgainButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
