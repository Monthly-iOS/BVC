//
//  ThreeButtonsView.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/6/24.
//

import UIKit

class ThreeButtonsView: UIView {
    let button1: UIButton = UIButton()
    let button2: UIButton = UIButton()
    let button3: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTripleButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func seriesButtonTapped(sender: UIButton) {
        print("시리즈 버튼 클릭")
    }
    
    private func setTripleButtons() {
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        
        let buttonHeight: CGFloat = 30
        
        button1.setTitle("시리즈", for: .normal)
        button1.layer.borderColor = UIColor.white.cgColor
        button1.layer.borderWidth = 1
        button1.layer.cornerRadius = buttonHeight / 2
        button1.addTarget(self, action: #selector(seriesButtonTapped(sender:)), for: .touchUpInside)
        
        button2.setTitle("테스트2", for: .normal)
        button2.layer.borderColor = UIColor.white.cgColor
        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = buttonHeight / 2
        
        button3.setTitle("테스트3", for: .normal)
        button3.layer.borderColor = UIColor.white.cgColor
        button3.layer.borderWidth = 1
        button3.layer.cornerRadius = buttonHeight / 2
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.leadingAnchor.constraint(equalTo: leadingAnchor),
            button1.widthAnchor.constraint(equalToConstant: 100),
            button1.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 10),
            button2.widthAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 10),
            button3.widthAnchor.constraint(equalToConstant: 100),
            button3.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }
}
