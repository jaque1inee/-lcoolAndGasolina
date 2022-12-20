//
//  HomeScreen.swift
//  AppAlcool
//
//  Created by Jaqueline Oliveira on 14/12/22.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedStartButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    public func delegate(delegate: HomeScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "BGHOME")
        backgroundImageView.contentMode = .scaleAspectFit
        
        return backgroundImageView
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let logoAppImageView = UIImageView()
        logoAppImageView.translatesAutoresizingMaskIntoConstraints = false
        logoAppImageView.image = UIImage(named: "LOGO")
        logoAppImageView.contentMode = .scaleAspectFit

        return logoAppImageView
    }()
    
    lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Começar", for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        startButton.setTitleColor(.white, for: .normal)
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 8
        startButton.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        startButton.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
        return startButton
        
    }()
    
    @objc func tappedStartButton() {
        
        delegate?.tappedStartButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(logoAppImageView)
        addSubview(startButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            self.backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            self.logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 100),
            
            self.startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            self.startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            self.startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
            self.startButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
}

