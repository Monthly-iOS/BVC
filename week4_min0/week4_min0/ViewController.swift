//
//  ViewController.swift
//  week4_min0
//
//  Created by 이민영 on 5/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        // item, layout에 사이즈 설정해야 나옴
        // one item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // item을 포함하는 group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    // CollectionView의 constraint 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "7 days"
        view.backgroundColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.dataSource = self
        
        collectionView.register(DayInfoCell.self, forCellWithReuseIdentifier: DayInfoCell.identifier)
    }
    
}


extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weekInfo.count
    }
    
    // 셀 등록
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexPath: 셀의 위치를 특정
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayInfoCell.identifier, for: indexPath) as! DayInfoCell
        cell.dayInfoCellItem = weekInfo[indexPath.row]
        return cell
        
    }
    
    
    
}
