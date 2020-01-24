//
//  LoadingViewController.swift
//  Narobil
//
//  Created by Dharmendria on 20/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class LoadingViewController: UIViewController {
    
    private let isUserLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(durationInSeconds: 3.0)
        {
            self.showInitialView()
        }
    }
    
    private func setupViews()
    {
        //view.backgroundColor = .orange
    }
    
    func showInitialView()
    {
        if isUserLoggedIn
        {
            PresenterManager.shared.show(vc: .mainTabBarController)
        }
        else{
            performSegue(withIdentifier: K.Segue.showOnboardingScreen, sender: nil)
        }
    }
}
