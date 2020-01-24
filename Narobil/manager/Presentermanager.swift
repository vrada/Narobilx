//
//  Presentermanager.swift
//  Narobil
//
//  Created by Dharmendria on 20/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import UIKit

class PresenterManager
{
    static let shared = PresenterManager()
    
    private init() {}
    
    enum VC{
        case mainTabBarController
        case onboarding
    }
    
    @available(iOS 13.0, *)
    func show(vc: VC)
    {
        var viewController: UIViewController
        switch vc {
        case .mainTabBarController:
            viewController = UIStoryboard(name: K.StoryboardID.main, bundle: nil).instantiateViewController(identifier: K.StoryboardID.mainTabBarController)
        case .onboarding:
            viewController = UIStoryboard(name: K.StoryboardID.main, bundle: nil).instantiateViewController(identifier: K.StoryboardID.onboardingViewController)
        }
        
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, let window = sceneDelegate.window
        {
            window.rootViewController = viewController
        
            // effect logout
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }

    }
}


