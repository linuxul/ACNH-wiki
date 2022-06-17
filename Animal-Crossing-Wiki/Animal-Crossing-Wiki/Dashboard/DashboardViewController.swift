//
//  DashboardViewController.swift
//  Animal-Crossing-Wiki
//
//  Created by Ari on 2022/05/04.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var coordinator: DashboardCoordinator?
    
    private lazy var sectionsScrollView = SectionsScrollView(
        SectionView(title: "My Island", iconName: "sun.haze", contentView: UserInfoSection()),
        SectionView(title: "Today's Tasks", iconName: "checkmark.seal.fill", contentView: TodaysTasksSesction()),
        SectionView(title: "My Villagers", iconName: "person.circle.fill", contentView: VillagersSection()),
        SectionView(title: "Collection Progress", iconName: "chart.pie.fill", contentView: CollecitonProgressSection())
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        view.backgroundColor = .acBackground
        navigationItem.title = Date().formatted("M월 d일, EEEE")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "slider.horizontal.3"),
            style: .plain,
            target: self,
            action: #selector(didTapSettingButton(_:))
        )
        
        view.addSubviews(sectionsScrollView)
        
        NSLayoutConstraint.activate([
            sectionsScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sectionsScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            sectionsScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            sectionsScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    @objc private func didTapSettingButton(_ sender: UIBarButtonItem) {
        coordinator?.present(PreferencesViewController())
    }
    
}
