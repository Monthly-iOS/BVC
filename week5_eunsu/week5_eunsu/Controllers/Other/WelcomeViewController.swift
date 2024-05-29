//
//  WelcomeViewController.swift
//  week5_eunsu
//
//  Created by Eunsu JEONG on 5/22/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    private let signInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Spotify"
        view.backgroundColor = .systemGreen
        setButton()
    }
    
    private func setButton() {
        view.addSubview(signInButton)
        
        signInButton.backgroundColor = .white
        signInButton.setTitle("Sign In with Spotify", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
