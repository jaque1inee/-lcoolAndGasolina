//
//  CalculatorScreen.swift
//  AppAlcool
//
//  Created by Jaqueline Oliveira on 14/12/22.
//

import UIKit

protocol CalculatorScreenDelegate: AnyObject {
    func tappedCalculateButton()
    func tappedBackButton()
}

class CalculatorScreen: UIView {
    
    private weak var delegate: CalculatorScreenDelegate?
    public func delegate(delegate: CalculatorScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named:"BG BLUR DARK")
        backgroundImage.contentMode = .scaleAspectFit
        return backgroundImage
    }()
    
    lazy var logoAppImageview: UIImageView = {
        let logoAppImageview = UIImageView()
        logoAppImageview.translatesAutoresizingMaskIntoConstraints = false
        logoAppImageview.image = UIImage(named: "LOGO menor")
        logoAppImageview.contentMode = .scaleAspectFit
        return logoAppImageview
    }()
    
    lazy var ethanolPriceTextField: UITextField = {
        let ethanolPriceTextField = UITextField()
        ethanolPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        ethanolPriceTextField.autocorrectionType = .no
        ethanolPriceTextField.backgroundColor = .white
        ethanolPriceTextField.borderStyle = .roundedRect
        ethanolPriceTextField.keyboardType = .decimalPad
        ethanolPriceTextField.placeholder = "Preço do Álcool"
        ethanolPriceTextField.textColor = .darkGray
        return ethanolPriceTextField
    }()
    
    lazy var gaslPriceTextField: UITextField = {
        let gaslPriceTextField = UITextField()
        gaslPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        gaslPriceTextField.autocorrectionType = .no
        gaslPriceTextField.backgroundColor = .white
        gaslPriceTextField.borderStyle = .roundedRect
        gaslPriceTextField.keyboardType = .decimalPad
        gaslPriceTextField.placeholder = "Preço da Gasolina"
        gaslPriceTextField.textColor = .darkGray
        return gaslPriceTextField
    }()
    
    lazy var calculateButton: UIButton = {
        let calculateButton = UIButton()
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.setTitle("Calcular", for: .normal)
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 8
        calculateButton.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        calculateButton.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return calculateButton
    }()
    
    @objc func tappedCalculateButton() {
        delegate?.tappedCalculateButton()
    }
    
    lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(named: "Botão Back"), for: .normal)
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return backButton
    }()
    
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
        
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(backgroundImage)
        addSubview(logoAppImageview)
        addSubview(ethanolPriceTextField)
        addSubview(gaslPriceTextField)
        addSubview(calculateButton)
        addSubview(backButton)
        configConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoAppImageview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoAppImageview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            
            ethanolPriceTextField.topAnchor.constraint(equalTo: logoAppImageview.bottomAnchor, constant: 134),
            ethanolPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanolPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanolPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            gaslPriceTextField.topAnchor.constraint(equalTo: ethanolPriceTextField.bottomAnchor, constant: 16),
            gaslPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            gaslPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            gaslPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
}
