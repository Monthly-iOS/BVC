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
        // ignore to safe area
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(NextStateCell.self, forCellWithReuseIdentifier: NextStateCell.identifier)
        collectionView.register(DayInfoCell.self, forCellWithReuseIdentifier: DayInfoCell.identifier)
    }
    
}


extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 1{
            return weekInfo.count
        } else {
            return tommorowItem.count
        }
    }
    
    // 셀 등록
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexPath: 셀의 위치를 특정
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayInfoCell.identifier, for: indexPath) as! DayInfoCell
            cell.dayInfoCellItem = weekInfo[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NextStateCell.identifier, for: indexPath) as! NextStateCell
            cell.nextStateItem = tommorowItem[indexPath.row]
            return cell
        }
        
    }
    
}
