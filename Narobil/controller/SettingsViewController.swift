//
//  SettingsNewController.swift
//  Narobil
//
//  Created by Dharmendria on 20/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class SettingsViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        view.backgroundColor = .gray
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem)
    {
        PresenterManager.shared.show(vc: .onboarding)
    }
    
}
