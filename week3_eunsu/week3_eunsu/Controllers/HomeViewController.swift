//
//  HomeViewController.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/4/24.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTV = 1
    case NowPlayingMovies = 2
    case PopularMovies = 3
    case TopRatedMovies = 4
    case UpcomingMovies = 5
}

class HomeViewController: UIViewController {
    private let viewModel: ViewModel
    private let homeFeedTable: UITableView = UITableView(frame: .zero, style: .grouped)
    private lazy var headerView = TopHeaderUIView(frame: CGRect(x: 0, 
                                                                y: 0,
                                                                width: view.bounds.width,
                                                                height: view.bounds.height * 0.6),
                                                  viewModel: viewModel)
    private let userID: String = "유니스"
    private let sectionTitles: [String] = ["오늘 대한민국의 TOP 10 영화", "오늘 대한민국의 TOP 10 시리즈", "현재 상영작", "누적 인기 영화", "리뷰가 좋은 영화", "상영 예정작"]
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        configureNavBar(userID: userID)
//        navigationItem.titleView = ThreeButtonsView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func configureNavBar(userID: String) {
        let userLabel: UILabel = UILabel()
        userLabel.text = "\(userID) 님"
        userLabel.textColor = .white
        userLabel.font = .systemFont(ofSize: 25, weight: .medium)
        
        let buttonsSize = CGRect(x: 0, y: 0, width: 35, height: 30)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        
        let airplayButton = UIButton()
        let airplayButtonItem = UIBarButtonItem.init(customView: airplayButton)
        airplayButton.setImage(UIImage(systemName: "airplayvideo", withConfiguration: imageConfig), for: .normal)
        airplayButton.frame = buttonsSize
        airplayButton.tintColor = .white
        
        let searchButton = UIButton()
        let searchButtonItem = UIBarButtonItem.init(customView: searchButton)
        searchButton.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: imageConfig), for: .normal)
        searchButton.frame = buttonsSize
        searchButton.tintColor = .white
        
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.hidesNavigationBarDuringPresentation = true
//        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
//        searchController.searchBar.scopeButtonTitles = ["시리즈", "영화"]
//        searchController.searchBar.showsScopeBar = true
//        
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: userLabel)
        navigationItem.rightBarButtonItems = [searchButtonItem, airplayButtonItem]
    }
    
    private func setTable() {
        homeFeedTable.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        homeFeedTable.tableHeaderView = headerView
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            Task {
                do {
                    let netflixItems = try await tmdbAPI.shared.requestTrendingMoviesOfToday()
                    cell.configure(with: netflixItems)
                }
            }
        case Sections.TrendingTV.rawValue:
            Task {
                do {
                    let netflixItems = try await tmdbAPI.shared.requestTrendingTVsOfToday()
                    cell.configure(with: netflixItems)
                }
            }
        case Sections.NowPlayingMovies.rawValue:
            Task {
                do {
                    let netflixItems = try await tmdbAPI.shared.requestNowPlayingMovies()
                    cell.configure(with: netflixItems)
                }
            }
        case Sections.PopularMovies.rawValue:
            Task {
                do {
                    let url = tmdbAPI.shared.popularMovieURL
                    let netflixItems = try await tmdbAPI.shared.requestMovie(url: url)
                    cell.configure(with: netflixItems)
                }
            }
        case Sections.TopRatedMovies.rawValue:
            Task {
                do {
                    let url = tmdbAPI.shared.topRatedMovieURL
                    let netflixItems = try await tmdbAPI.shared.requestMovie(url: url)
                    cell.configure(with: netflixItems)
                }
            }
        case Sections.UpcomingMovies.rawValue:
            Task {
                do {
                    let url = tmdbAPI.shared.UpcomingMovieURL
                    let netflixItems = try await tmdbAPI.shared.requestMovie(url: url)
                    cell.configure(with: netflixItems)
                }
            }
        default:
            return UITableViewCell()
        }
        
        return cell
    }
    
    //section title 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 0, y: 15, width: 320, height: 18)
        myLabel.font = UIFont.boldSystemFont(ofSize: 18)
        myLabel.text = sectionTitles[section]
        
        let headerView = UIView()
        headerView.addSubview(myLabel)
        
        return headerView
    }
    
    //각 셀의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
