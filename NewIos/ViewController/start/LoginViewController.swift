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
    
    @IBOutlet weak var mainView: UIView!
    
    var tfCurrent : UITextField!
    

    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillChange) , name: UIResponder.keyboardWillHideNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillChange) , name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillChange) , name: UIResponder.keyboardWillShowNotification , object: nil)
        
        
    
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func doLogin(gesture: UITapGestureRecognizer)
    {
        Logger.log(data: "DO LOGIN")
        Utility.hideKeyword(view: self.view)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        let nextTag = textField.tag + 1
        let uiRespond = textField.superview?.viewWithTag(nextTag) as UIResponder?
        if uiRespond != nil{
            uiRespond?.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
        }
        return false
    }
    
    @objc func keyboardWillChange(notification: Notification)
    {
        Logger.log(data: notification.name.rawValue)
        
        if notification.name.rawValue == UIResponder.keyboardWillHideNotification.rawValue
        {
            mainView.frame.origin.y = 0
        }
        else
        {
            let keyBroadFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect

            Logger.log(data: "TEXT FIELD TAG", tfCurrent.tag)
            Logger.log(data: "TEXT FIELD Y " , tfCurrent.frame.origin.y)
            Logger.log(data: "SUBVIEW FIELD Y " , subView.frame.origin.y)
            Logger.log(data: "KEY BOARD  H " , keyBroadFrame.height)
            Logger.log(data: "MAIN VIEW  H " , mainView.frame.height)
            Logger.log(data: "TEXT FIELD H", tfCurrent.frame.height)
            
            if tfCurrent.frame.origin.y + keyBroadFrame.height + tfCurrent.frame.height + subView.frame.origin.y + 50.0 >= mainView.frame.height
            {
                mainView.frame.origin.y = -(subView.frame.origin.y + tfCurrent.frame.origin.y + keyBroadFrame.height + tfCurrent.frame.height  + 50.0 - mainView.frame.height)
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tfCurrent = textField
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
