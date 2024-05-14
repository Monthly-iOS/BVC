//
//  TabViewController.swift
//  WeatherApp
//
//  Created by 황민채 on 5/13/24.
//

import UIKit

final class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tab1 = WeatherViewController()
        tab1.title = "Weather"
        
        let tab2 = SettingsViewController()
        tab2.title = "Setting"
        
        let nav1 = UINavigationController(rootViewController: tab1)
        let nav2 = UINavigationController(rootViewController: tab2)
        
        nav1.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(named: "cloud.sun"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "gear"), tag: 2)
       
        setViewControllers([
            nav1, nav2
        ], animated: true)
    }
}
