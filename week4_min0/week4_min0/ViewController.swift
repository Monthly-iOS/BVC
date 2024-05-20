//
//  ViewController.swift
//  week4_min0
//
//  Created by 이민영 on 5/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, rect) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0: return CompositionalLayoutSection.tommorowSection()
            case 1: return CompositionalLayoutSection.weekSection()
            default: return nil
            }
            
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        
        return collectionView
    }()
    
    // CollectionView의 constraint 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
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
        collectionView.contentInsetAdjustmentBehavior = .never  // ignore to safe area
        
        collectionView.register(TommorowCell.self, forCellWithReuseIdentifier: TommorowCell.identifier)
        collectionView.register(WeekCell.self, forCellWithReuseIdentifier: WeekCell.identifier)
    }
    
}


extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0{
            return tommorowItem.count
        } else {
            return weekInfo.count
        }
    }
    
    // 셀 등록
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TommorowCell.identifier, for: indexPath) as! TommorowCell
            cell.nextStateItem = tommorowItem[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekCell.identifier, for: indexPath) as! WeekCell
            cell.dayInfoCellItem = weekInfo[indexPath.row]
            return cell
        }
        
    }
    
}
