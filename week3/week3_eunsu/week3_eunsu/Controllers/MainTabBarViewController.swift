//
//  MainTabBarViewController.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/4/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    private let viewModel: ViewModel
    private lazy var tabItem1 = UINavigationController(rootViewController: HomeViewController(viewModel: viewModel))
    private let tabItem2 = UINavigationController(rootViewController: NewAndHotViewController())
    private let tabItem3 = UINavigationController(rootViewController: MyNetflixViewController())

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarUI()
        setViewControllers([tabItem1, tabItem2, tabItem3], animated: true)
    }

    private func setTabBarUI() {
        tabItem1.tabBarItem.image = UIImage(systemName: "house")
        tabItem2.tabBarItem.image = UIImage(systemName: "play.square.stack")
        tabItem3.tabBarItem.image = UIImage(systemName: "person.crop.square")
        
        tabItem1.title = "홈"
        tabItem2.title = "NEW & HOT"
        tabItem3.title = "나의 넷플릭스"
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        tabBar.barTintColor = .systemGray6
    }

}

