//
//  HomeViewController.swift
//  NewIos
//
//  Created by Developer on 11/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imgSideMenu: UIImageView!
    
    @IBOutlet weak var sideMenuView: UIView!
    
    var sideMenu : Bool = false
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

        // Do any additional setup after loading the view.
    }
    
    func setUp()
    {
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        self.addChild(viewController)
        viewController.view.frame = CGRect(x: 0, y: 0, width: sideMenuView.frame.width, height: sideMenuView.frame.height)
        sideMenuView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        let garagesViewController = self.storyboard?.instantiateViewController(withIdentifier: "GaragesViewController") as! GaragesViewController
        self.addChild(garagesViewController)
        garagesViewController.view.frame = CGRect(x: 0, y: 0, width: subView.frame.width, height: subView.frame.height)
        subView.addSubview(garagesViewController.view)
        garagesViewController.didMove(toParent: self)
        
        let gesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.controlSideMenu))
        
        imgSideMenu.isUserInteractionEnabled = true
        imgSideMenu.addGestureRecognizer(gesture)
        
        if sideMenu
        {
            mainView.frame.origin.x = view.frame.width - 50
        }
        else
        {
            mainView.frame.origin.x = 0
        }
       
        
        
    }
    
    @objc public func controlSideMenu(gesture: UITapGestureRecognizer)
    {
        if sideMenu
        {
            mainView.frame.origin.x = 0
            sideMenu = false
        }
        else
        {
            mainView.frame.origin.x = view.frame.width - 50
            sideMenu = true
        }
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
