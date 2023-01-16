//
//  CalculatorViewController.swift
//  AppAlcool
//
//  Created by Jaqueline Oliveira on 14/12/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var screen: CalculatorScreen?
    var alert: Alert?
    
    override func loadView() {
        screen =  CalculatorScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validateTextField() -> Bool {
        
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else {return false}
        guard let gasPrice = screen?.gaslPriceTextField.text else {return false}
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do álcool e da gasolina")
            return false
        } else if  ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor do álcool")
            return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor da gasolina!")
            return false
        }
        return true
    }
}

extension CalculatorViewController: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        
        if validateTextField() {
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            let gasPrice: Double = (formatter.number(from: screen?.gaslPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            
            let vc = ResultViewController()
            if (ethanolPrice / gasPrice) > 0.7 {
                vc.resultCalculator = "Gasolina"

            } else {
                vc.resultCalculator = "Álcool"
            }
            clearViewData()
            navigationController?.pushViewController(vc, animated: true)
        }
        
        func clearViewData() {
            
            screen?.ethanolPriceTextField.text = ""
            screen?.gaslPriceTextField.text = ""
        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true )
    }
}

