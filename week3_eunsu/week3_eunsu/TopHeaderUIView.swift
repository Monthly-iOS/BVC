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
    
    init(frame: CGRect, viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setTopHeader()
        addGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topImageView.frame = bounds
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
