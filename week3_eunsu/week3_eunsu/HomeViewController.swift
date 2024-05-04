//
//  HomeViewController.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/4/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeFeedTable: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func setTable() {
        homeFeedTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello!"
        return cell
    }
    
    //각 셀의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
