//
//  HelperViewController.swift
//  NewIos
//
//  Created by Developer on 08/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class HelperViewController: UIViewController, IViewController
{

    

    public var dataProvider : DataProvider!
    
    @IBOutlet weak var topBarView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var imgBack: UIImageView!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.setUp()
        self.addViewController()
    }
    
    func setUp()
    {
        lbTitle.text = "Register"
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HelperViewController.dismiss))
        imgBack.isUserInteractionEnabled = true
        imgBack.addGestureRecognizer(tapGesture)
    }
    
    func addViewController()
    {
        Logger.log(data:"adding subview")
        containerView.isHidden = true
        
        if dataProvider == nil
        {
            return
        }
        
        let viewController : UIViewController!
        
        switch dataProvider.viewControllerKey
        {
            case 7001: // tab controller
                changeTitle(title: "Tab Bar")
                viewController  =  self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                break
            
            case 7002: // home controller
                changeTitle(title: "Home")
                viewController  =  self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                break
            case 7003:  // register
                changeTitle(title: "")
                viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
                break
            case 7004: //  login
                changeTitle(title: "Login")
                viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            case 7005: // garages list
                changeTitle(title: "Garages")
                viewController = self.storyboard?.instantiateViewController(withIdentifier: "GaragesViewController") as! GaragesViewController
            
            case 7006: // garage overview
                changeTitle(title: "")
                viewController = self.storyboard?.instantiateViewController(withIdentifier: "GarageOverviewViewController") as! GarageOverviewViewController
            
            default:
                changeTitle(title: "")
                return
            
        }
        
        
        //let homeViewController  =  self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.addChild(viewController)
        
        viewController.view.frame = CGRect(x: 0, y: 0, width: bottomView.frame.width, height: bottomView.frame.height)
        bottomView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    @objc func dismiss(gesture: UITapGestureRecognizer)
    {
        Logger.log(data: "clicked back press")
        self.dismiss(animated: true)
    }
    
    
    func changeTitle(title: String) {
        lbTitle.text = title
    }
    
    func showSnackBar(message: String) {
        
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
