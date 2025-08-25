//
//  RMEpisodeViewController.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 21/08/2025.
//

import UIKit
import FirebaseAnalytics

class RMEpisodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Episodes"
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "EPISODES Screen Select",
                                       AnalyticsParameterScreenClass: "RMEpisodeViewController"])
    }

}
