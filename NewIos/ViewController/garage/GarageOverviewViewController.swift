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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func setUp()
    {
        let viewController  = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        viewController.garage = garage
        
        self.addChild(viewController)
        
        viewController.view.frame = CGRect(x: 0, y: 0, width: subView.frame.width, height: subView.frame.height)
        subView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        
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
