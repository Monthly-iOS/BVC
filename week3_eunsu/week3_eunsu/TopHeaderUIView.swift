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
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topImageView.frame = bounds
    }
    
    private func setTopHeader() {
        addSubview(topImageView)
        
        topImageView.contentMode = .scaleAspectFit
        topImageView.clipsToBounds = true
        
        Task {
            do {
                topImageView.image = try await viewModel.fetchImage(url: "https://i.namu.wiki/i/PHz0eVxMVdh9CaIi5yTK6GoxhNL79I_N10PmeyYEMcBUxyTX7zGfLyV46lEwNsxxdHJoLhoeUklYFMJVD-bsETOE8RMmhlYU6wprMPDe7WCHZDJ0TkCCtKMwY5tBp5lqt8MiGNgLDqLo2fypnSjiSw.webp")
            } catch {
                print("Cannot find header image")
            }
        }
    }
}
