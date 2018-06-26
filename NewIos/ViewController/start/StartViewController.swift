//
//  StartViewController.swift
//  NewIos
//
//  Created by Developer on 07/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class StartViewController: UIViewController
{
    

    @IBOutlet weak var lbContinue: UILabel!
    
    @IBOutlet weak var lbWelcome: UILabel!
    
    
    
    override func viewDidLoad() {
        
        
        
        let attributedString : NSMutableAttributedString = NSMutableAttributedString(string: Constants.WELCOME_NOTE)
        
        let attribs = [
            NSAttributedString.Key.foregroundColor : Utility.getColor(value: Constants.COLOR_PRIMARY)
        ]
        
        let attribsBottom = [
            NSAttributedString.Key.font : UIFont(name: "Futura", size: 18)!,
            NSAttributedString.Key.foregroundColor : Utility.getColor(value: Constants.DEFAULT)
        ]
        
        
        
        attributedString.addAttributes(attribs, range: NSRange.init(location: 0, length: 9))
        
        attributedString.addAttributes(attribsBottom, range: NSRange.init(location: 9, length: Constants.WELCOME_NOTE.count - 9))
        
        lbWelcome.numberOfLines = 3
        
        lbWelcome.attributedText = attributedString
        
        super.viewDidLoad()
        
        //lbWelcome.textColor = Utility.getColor(value: Constants.COLOR_PRIMARY);
        
        self.setUp()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func setUp()
    {
        lbContinue.backgroundColor = Utility.getColor(value: Constants.COLOR_PRIMARY)
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self,  action: #selector(StartViewController.goToOther))
        lbContinue.isUserInteractionEnabled = true
        lbContinue.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func goToOther(gesture: UITapGestureRecognizer)
    {
        
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
         self.present(homeViewController, animated: false, completion: nil)

        return
        
        Logger.log(data: "continue is clicked")
        let helperViewController = self.storyboard?.instantiateViewController(withIdentifier: "HelperViewController") as! HelperViewController
        helperViewController.dataProvider = DataProvider(key: 7005 ,params: [:])
        
        self.present(helperViewController, animated: false, completion: nil)
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
