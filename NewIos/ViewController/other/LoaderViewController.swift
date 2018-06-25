//
//  LoaderViewController.swift
//  NewIos
//
//  Created by Developer on 25/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var btAlert: UIButton!
    
    @IBAction func showAlert(_ sender: Any)
    {
        let alert = UIAlertController(title: "Did you bring your Macbook?", message: "It's recommended you bring your Macbook before continuing.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

        // Do any additional setup after loading the view.
    }
   
    func setUp()
    {
        indicator.startAnimating()
        
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
