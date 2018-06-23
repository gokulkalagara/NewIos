//
//  GarageOverviewViewController.swift
//  NewIos
//
//  Created by Developer on 15/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class GarageOverviewViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var subView: UIView!
    
    @IBOutlet weak var bottomBar: UIView!
    
    @IBOutlet weak var lbDetails: UILabel!
    
    @IBOutlet weak var lbServices: UILabel!
    
    @IBOutlet weak var lbReviews: UILabel!
    
    public var garage: Garage!
    
    public var previous : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func setUp()
    {
        changeView(value: 1)
        
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GarageOverviewViewController.tabListener))
        let tapGesture1 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GarageOverviewViewController.tabListener))
        let tapGesture2 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GarageOverviewViewController.tabListener))
        
        lbDetails.isUserInteractionEnabled = true
        lbReviews.isUserInteractionEnabled = true
        lbServices.isUserInteractionEnabled = true
        
        lbDetails.addGestureRecognizer(tapGesture)
        lbServices.addGestureRecognizer(tapGesture1)
        lbReviews.addGestureRecognizer(tapGesture2)
        
        
        
        
    }
    
    @objc public func tabListener(gesture: UITapGestureRecognizer)
    {
        switch gesture.view
        {
        case lbDetails:
             changeView(value: 1)
           
            break
            
        case lbServices:
            changeView(value: 2)
            
            break
            
        case lbReviews:
            changeView(value: 3)
            
            break
            
        default:
            return
            
        }
    }
    
    
    public func changeView(value: Int)
    {
        let viewController : UIViewController!
        
        if previous == value
        {
            return
        }
        
        switch value
        {
        case 1:
            let viewController1  = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            viewController1.garage = garage
            viewController = viewController1
            
            lbDetails.textColor = Utility.getColor(value: Constants.COLOR_PRIMARY)
            lbServices.textColor = Utility.getColor(value: Constants.THICK_GRAY)
            lbReviews.textColor = Utility.getColor(value: Constants.THICK_GRAY)
            
            
            break
        case 2:
             let viewController2  = self.storyboard?.instantiateViewController(withIdentifier: "ServicesViewController") as! ServicesViewController
             
             viewController = viewController2
             
             lbDetails.textColor = Utility.getColor(value: Constants.THICK_GRAY)
             lbServices.textColor = Utility.getColor(value: Constants.COLOR_PRIMARY)
             lbReviews.textColor = Utility.getColor(value: Constants.THICK_GRAY)
             
             
            break
        case 3:
             let viewController3  = self.storyboard?.instantiateViewController(withIdentifier: "ReviewsViewController") as! ReviewsViewController
             
             viewController = viewController3
             
             lbDetails.textColor = Utility.getColor(value: Constants.THICK_GRAY)
             lbServices.textColor = Utility.getColor(value: Constants.THICK_GRAY)
             lbReviews.textColor = Utility.getColor(value: Constants.COLOR_PRIMARY)
             
             
            break
            
        default:
            return
        }
        
        self.addChild(viewController)
        
        viewController.view.frame = CGRect(x: 0, y: 0, width: subView.frame.width, height: subView.frame.height)
        subView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        previous = value
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
