//
//  LoginViewController.swift
//  Narobil
//
//  Created by Dharmendria on 22/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    
    @IBOutlet weak var akunTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var masukBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
        // hide keyboard when tap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func setupLoginView()
    {
        akunTextfield.layer.cornerRadius = 7
        akunTextfield.layer.shadowOpacity = 0.5
        akunTextfield.layer.shadowColor = UIColor.darkGray.cgColor
        passwordTextfield.layer.cornerRadius = 7
        passwordTextfield.layer.shadowOpacity = 0.5
        passwordTextfield.layer.shadowColor = UIColor.darkGray.cgColor
        masukBtn.layer.cornerRadius = 7
        masukBtn.layer.shadowOpacity = 0.5
        masukBtn.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    
    private var errorMessage: String?
    {
        didSet{
            
        }
    }
    
    private func showErrorMessageIfNedded(text: String?)
    {
    
    }
    
    @IBAction func daftarBtnx(_ sender: Any) {
        performSegue(withIdentifier: K.Segue.showregisback, sender: nil)
    }
    
    // func hide keyboard when tap
           @objc func dismissKeyboard() {
           view.endEditing(true)
    }
    
    @available(iOS 13.0, *)
    @IBAction func loginBtn(_ sender: Any) {
        guard
            let username = akunTextfield.text,
        let password = passwordTextfield.text else { return }
        
        if(username == "" || password == "")
        {
            let alertMessage: String = "Silahkan mengisi username dan password"
            NotifAlert(alertMessage: alertMessage)
        }
        
        else
        {
            let base64Encoded = Data("\(username):\(password)".utf8).base64EncodedString()
            //print(base64Encoded)
            let semaphore = DispatchSemaphore (value: 0)
            
            var request = URLRequest(url: URL(string: "http://149.129.216.88:8670/Host/Optima/Session/Login")!,timeoutInterval: Double.infinity)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.addValue("17e2bd3f01bd2439a9a31c0d89b02c4a2", forHTTPHeaderField: "APIKey")
            request.addValue("Basic \(base64Encoded)", forHTTPHeaderField: "Authorization")

            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard error == nil else {
                    debugPrint(error.debugDescription)
                    return
                }
              guard let data = data else {return}
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                    //guard let json = jsonAny as? [String: Any] else { return }
                        
                        if let loginres = json["LoginResponse"] as? Array<Dictionary<String, String>>
                        {
                            for loginx in loginres
                            {
                                //print(loginx["token"] ?? "")
                                let defaults = UserDefaults.standard
                                defaults.set("\(String(describing: loginx["token"]))", forKey: "sessionToken")
                            }
                        }
                        let defaults = UserDefaults.standard
                        if let sesToken = defaults.string(forKey: "sessionToken")
                        {
                            print(sesToken)
                        }
                            
                        if let rcx = json["status"] as? [String:String]
                        {
                            //let rc: String = rcx["responseCode"] ?? String;
                            if rcx["responseCode"] == "A00"
                            {
                                /*
                                let main = UIStoryboard(name: "Main", bundle: nil)
                                let second = main.instantiateViewController(withIdentifier: "dashboardVC")
                                self.present(second,animated: true,completion: nil)
                                */
                                //print(rcx["description"]!)
                                //print(rcx["message"]!)
                                print("Berhasil Login")
                                PresenterManager.shared.show(vc: .mainTabBarController)
                            }
                            
                        }
                        
                        
                        //print(json)
                    }
                }
                catch
                {
                    debugPrint(error.localizedDescription)
                    return
                }
                
                
              //print(String(data: data, encoding: .utf8)!)
              semaphore.signal()
                
            }

            task.resume()
            semaphore.wait()
        }
    }
    
    func NotifAlert(alertMessage: String)
    {
        let alert = UIAlertController(title: "Notification Alert", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
