//
//  RegisterViewController.swift
//  Narobil
//
//  Created by Dharmendria on 22/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var namaAkunTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var notlpTextField: UITextField!
    @IBOutlet weak var daftarBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regisView()
        disabledKeyboard()
    }
    
    private func regisView()
    {
        namaAkunTextField.layer.cornerRadius = 7
        namaAkunTextField.layer.shadowOpacity = 0.5
        namaAkunTextField.layer.shadowColor = UIColor.darkGray.cgColor
        emailTextField.layer.cornerRadius = 7
        emailTextField.layer.shadowOpacity = 0.5
        emailTextField.layer.shadowColor = UIColor.darkGray.cgColor
        notlpTextField.layer.cornerRadius = 7
        notlpTextField.layer.shadowOpacity = 0.5
        notlpTextField.layer.shadowColor = UIColor.darkGray.cgColor
        daftarBtn.layer.cornerRadius = 7
        daftarBtn.layer.shadowOpacity = 0.5
        daftarBtn.layer.shadowColor = UIColor.darkGray.cgColor
    }
    @IBAction func pindahLoginBtn(_ sender: Any) {
        performSegue(withIdentifier: K.Segue.showLogin, sender: nil)
    }
    
    func disabledKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
              view.endEditing(true)
       }
}
