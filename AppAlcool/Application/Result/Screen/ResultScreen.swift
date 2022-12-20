//
//  ResultScreen.swift
//  AppAlcool
//
//  Created by Jaqueline Oliveira on 19/12/22.
//

import UIKit

protocol ResultDelegate: AnyObject {
    func calculateAgainButton()
    func tappedBackButton()
}

class ResultScreen: UIView {

    private weak var delegate: ResultDelegate?
    public func delegate(delegate: ResultDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImageView:  UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "BG BLUR DARK")
        backgroundImageView.contentMode = .scaleAspectFit
        return backgroundImageView
    }()
    
    lazy var logoAppImageview: UIImageView = {
        let logoAppImageview = UIImageView()
        logoAppImageview.translatesAutoresizingMaskIntoConstraints = false
        logoAppImageview.image = UIImage(named: "LOGO menor")
        logoAppImageview.contentMode = .scaleAspectFit
        return logoAppImageview
    }()
    
    lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = "Abasteça com:"
        resultLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 22)
        resultLabel.numberOfLines = 0
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
        return resultLabel
    }()
    
    lazy var selectedResultLabel: UILabel = {
        let selectedResultLabel = UILabel()
        selectedResultLabel.translatesAutoresizingMaskIntoConstraints = false
        selectedResultLabel.text = ""
        selectedResultLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30)
        selectedResultLabel.numberOfLines = 0
        selectedResultLabel.textColor = .white
        selectedResultLabel.textAlignment = .center
        return selectedResultLabel
    }()
    
    lazy var calculateAgainButton: UIButton = {
        let calculateAgainButton = UIButton()
        calculateAgainButton.translatesAutoresizingMaskIntoConstraints = false
        calculateAgainButton.setTitle("Calcular Novamente", for: .normal)
        calculateAgainButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        calculateAgainButton.setTitleColor(.white, for: .normal)
        calculateAgainButton.clipsToBounds = true
        calculateAgainButton.layer.cornerRadius = 8
        calculateAgainButton.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        calculateAgainButton.addTarget(self, action: #selector(calculateAgain), for: .touchUpInside)
        return calculateAgainButton
    }()

    @objc func calculateAgain() {
        delegate?.calculateAgainButton()
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
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(logoAppImageview)
        addSubview(resultLabel)
        addSubview(selectedResultLabel)
        addSubview(calculateAgainButton)
        addSubview(backButton)
        configConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has a not been implemented")
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoAppImageview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoAppImageview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            resultLabel.topAnchor.constraint(equalTo: logoAppImageview.bottomAnchor, constant: 80),
            
            selectedResultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            selectedResultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            selectedResultLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            
            calculateAgainButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateAgainButton.heightAnchor.constraint(equalToConstant: 44),

        ])
    }
}
