//
//  RMTabarViewController.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 21/08/2025.
//

import UIKit
import FirebaseAnalytics

class RMTabarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "Tab bar Screen Select",
                                       AnalyticsParameterScreenClass: "RMTabarViewController"])
        setUpTabs()
    }


    func setUpTabs() {
        
        let chateresVC = RMCharactereViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingViewController()
        
        chateresVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: chateresVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image:  UIImage(systemName: "person.crop.circle"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Episodes", image:  UIImage(systemName: "display"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Locations", image:  UIImage(systemName: "globe"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image:  UIImage(systemName: "gear"), tag: 4)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        
        
        
        setViewControllers([ nav1,nav2, nav3, nav4], animated: true)
    }
}

