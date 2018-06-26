//
//  HomeViewController.swift
//  NewIos
//
//  Created by Developer on 11/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, IViewController , ISwitchView
{
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var imgSideMenu: UIImageView!
    
    @IBOutlet weak var sideMenuView: UIView!
    
    public var sideMenu : Bool = false
    
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
        viewController.iSwitchView = self
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
            mainView.frame.origin.x = view.frame.width - 53
        }
        else
        {
            mainView.frame.origin.x = 0
        }
       
        
        
    }
    
    @objc public func controlSideMenu(gesture: UITapGestureRecognizer)
    {
        doSlide()
    }
    
    public func doSlide()
    {
        if sideMenu
        {
            mainView.frame.origin.x = 0
            sideMenu = false
        }
        else
        {
            mainView.frame.origin.x = view.frame.width - 53
            sideMenu = true
        }
    }
    
    func changeView(position: Int)
    {
        mainView.frame.origin.x = 0
        sideMenu = false
        changeTitle(title: Utility.generateMenu()[position].name)
        switch position
        {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        case 5:
            break
        case 6:
            break
        default:
            break
        }
        
    }
    
    func changeTitle(title: String) {
        lbTitle.text = title
    }
    
    func showSnackBar(message: String)
    {
        
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
