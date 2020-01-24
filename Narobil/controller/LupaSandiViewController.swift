//
//  LupaSandiViewController.swift
//  Narobil
//
//  Created by Dharmendria on 23/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import UIKit

class LupaSandiViewController: UIViewController {
    
    
    @IBOutlet weak var lupaEmailTextfield: UITextField!
    @IBOutlet weak var kirimLupaSandi: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customForgetPass()
    }
    
    private func customForgetPass()
    {
        lupaEmailTextfield.layer.cornerRadius = 7
        lupaEmailTextfield.layer.shadowOpacity = 0.5
        lupaEmailTextfield.layer.shadowColor = UIColor.darkGray.cgColor
        kirimLupaSandi.layer.cornerRadius = 7
        kirimLupaSandi.layer.shadowOpacity = 0.5
        kirimLupaSandi.layer.shadowColor = UIColor.darkGray.cgColor
    }
}
