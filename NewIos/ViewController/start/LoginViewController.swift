//
//  LoginViewController.swift
//  NewIos
//
//  Created by Developer on 13/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var tfEmailAddress: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var lbSignIn: UILabel!
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setUp();
        
    
        

        // Do any additional setup after loading the view.
    }

    
    func setUp()
    {
        subView.layer.cornerRadius = 10
        subView.clipsToBounds = true
        
        lbSignIn.layer.cornerRadius = 10
        lbSignIn.clipsToBounds = true
        
        tfEmailAddress.delegate = self
        tfPassword.delegate = self
        
        tfPassword.isSecureTextEntry = true
        
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.doLogin))
        
        lbSignIn.isUserInteractionEnabled = true
        lbSignIn.addGestureRecognizer(tapGesture)
    
    }
    
    @objc func doLogin(gesture: UITapGestureRecognizer)
    {
        Logger.log(data: "DO LOGIN")
        Utility.hideKeyword(view: self.view)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Utility.hideKeyword(view: self.view)
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
