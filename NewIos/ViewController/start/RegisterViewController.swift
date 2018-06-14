//
//  RegisterViewController.swift
//  NewIos
//
//  Created by Developer on 12/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var tfFirstName: UITextField!
    
    @IBOutlet weak var tfLastName: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    @IBOutlet weak var tfZipCode: UITextField!
    
    @IBOutlet weak var lbRegister: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp()
    {
        tfPassword.isSecureTextEntry = true
        tfConfirmPassword.isSecureTextEntry = true
        tfPhoneNumber.keyboardType = UIKeyboardType.numberPad
        tfZipCode.keyboardType = UIKeyboardType.numberPad
        
        tfFirstName.delegate = self
        tfLastName.delegate = self
        tfEmail.delegate = self
        tfPhoneNumber.delegate = self
        tfPassword.delegate = self
        tfConfirmPassword.delegate = self
        tfZipCode.delegate = self
        
        addDoneButtonOnKeyboard()
        
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.doRegister))
        lbRegister.isUserInteractionEnabled = true
        lbRegister.addGestureRecognizer(tapGesture)

    }
    
    
    func addDoneButtonOnKeyboard()
    {
        let nextToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 55))
        nextToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(self.nextButtonAction))
        done.tintColor = Utility.getColor(value: Constants.DEFAULT)
        
        done.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Futura", size: 20)!], for: UIControl.State.normal)
        done.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Futura", size: 20)!, NSAttributedString.Key.foregroundColor : Utility.getColor(value: Constants.SUCCESS_GREEN)], for: UIControl.State.selected)
        
        let items = [flexSpace, done]
        nextToolbar.items = items
        nextToolbar.sizeToFit()
        
        self.tfPhoneNumber.inputAccessoryView = nextToolbar
        
        let doneToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 55))
        doneToolbar.barStyle = .default
        
        let done1: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        done1.tintColor = Utility.getColor(value: Constants.DEFAULT)
        
        done1.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Futura", size: 20)!], for: UIControl.State.normal)
        done1.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Futura", size: 20)!, NSAttributedString.Key.foregroundColor : Utility.getColor(value: Constants.SUCCESS_GREEN)], for: UIControl.State.selected)
        
        
        doneToolbar.items = [flexSpace, done1]
        self.tfZipCode.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
        Utility.hideKeyword(view: self.view)
    }
    
    @objc func nextButtonAction()
    {
        let nextTag = tfPhoneNumber.tag + 1
        // Try to find next responder
        let nextResponder = tfPhoneNumber.superview?.viewWithTag(nextTag) as UIResponder?
        if nextResponder != nil
        {
            // Found next responder, so set it
            nextResponder?.becomeFirstResponder()
        }
        else
        {
            // Not found, so remove keyboard
            tfPhoneNumber.resignFirstResponder()
        }
    }

    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        let nextTag = textField.tag + 1
        // Try to find next responder
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?
        
        if nextResponder != nil
        {
            // Found next responder, so set it
            nextResponder?.becomeFirstResponder()
        }
        else
        {
            // Not found, so remove keyboard
            textField.resignFirstResponder()
        }
        
        return false
        //Utility.hideKeyword(view: self.view)
        //return true
    }
    
    @objc func doRegister(gesture: UITapGestureRecognizer)
    {
        Logger.log(data: "Register")
        Utility.hideKeyword(view: self.view)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField
        {
        case tfPhoneNumber:
            
            let phone : String = tfPhoneNumber.text! + string
            if phone.count <= 10
            {
                return true
            }
            tfPhoneNumber.text = String(phone.prefix(10))
            return false
            
        case tfZipCode:
            
            let zipCode : String = tfZipCode.text! + string
            if zipCode.count <= 6
            {
                return true
            }
            tfZipCode.text = String(zipCode.prefix(6)) //zipCode.substring(to: zipCode.index(zipCode.startIndex, offsetBy: 6))
            return false
        
        default:
             break
        }
        
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
