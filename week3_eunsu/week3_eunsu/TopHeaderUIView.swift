//
//  TopHeaderUIView.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/4/24.
//

import UIKit

class TopHeaderUIView: UIView {
    private var viewModel: ViewModel
    private let topImageView: UIImageView = UIImageView()
    private let playButton: UIButton = UIButton()
    private let downloadButton: UIButton = UIButton()
    
    init(frame: CGRect, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setTopHeader()
        addGradient()
        setButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topImageView.frame = bounds
    }
    
    private func setButtons() {
        addSubview(playButton)
        addSubview(downloadButton)
        
        playButton.setTitle("  재생", for: .normal)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.tintColor = .black
        playButton.titleLabel?.font = .systemFont(ofSize: 14)
        playButton.layer.backgroundColor = UIColor.white.cgColor
        playButton.layer.cornerRadius = 3
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        downloadButton.setTitle("  내가 찜한 리스트", for: .normal)
        downloadButton.setImage(UIImage(systemName: "plus"), for: .normal)
        downloadButton.setTitleColor(.white, for: .normal)
        downloadButton.tintColor = .white
        downloadButton.titleLabel?.font = .systemFont(ofSize: 13)
        downloadButton.layer.backgroundColor = UIColor.systemGray6.cgColor
        downloadButton.layer.cornerRadius = 3
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            playButton.widthAnchor.constraint(equalToConstant: frame.width / 2.6),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            
            downloadButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            downloadButton.bottomAnchor.constraint(equalTo: playButton.bottomAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: frame.width / 2.6),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func setTopHeader() {
        addSubview(topImageView)
        
        topImageView.contentMode = .scaleAspectFit
        topImageView.clipsToBounds = true
        
        Task {
            do {
                topImageView.image = try await viewModel.fetchImage(url: "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20240207_151%2F1707288437263gBsdd_JPEG%2Fmovie_image.jpg")
            } catch {
                print("Cannot find header image")
            }
        }
    }
}
