//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Hai Nguyen on 06/02/2023.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTabs()
    }
    
    private func setUpTabs() {
        let charatersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        charatersVC.tabBarItem = UITabBarItem(
            title: "Charaters",
            image: UIImage(systemName: "person"),
            tag: 1)
        locationsVC.tabBarItem = UITabBarItem(
            title: "Locations",
            image: UIImage(systemName: "globe"),
            tag: 1)
        episodesVC.tabBarItem = UITabBarItem(
            title: "Episodes",
            image: UIImage(systemName: "tv"),
            tag: 1)
        settingsVC.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            tag: 1)
        
        
        let nav1 = UINavigationController(rootViewController: charatersVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
    [nav1, nav2, nav3, nav4],
    animated: true
        )
        
    }


}

