//
//  GaragesViewController.swift
//  NewIos
//
//  Created by Developer on 14/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class GaragesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var garagesList : [Garage]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garagesList = Utility.generateGarages()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width - 30, height: 224)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        
        if garagesList.count > 0
        {
            collectionView.reloadData()
        }

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return garagesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let garageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GarageCollectionViewCell", for: indexPath) as! GarageCollectionViewCell
        
        garageCell.lbGarageName.text = garagesList[indexPath.row].name
        garageCell.lbPoints.text = String(garagesList[indexPath.row].points)
        garageCell.lbAddress.text = garagesList[indexPath.row].address
        garageCell.lbDistance.text = String(garagesList[indexPath.row].distance) + "kms from you"
        
        garageCell.mainView.layer.cornerRadius = 5
        garageCell.mainView.clipsToBounds = true
        garageCell.lbFirstDot.layer.cornerRadius = 2.5
        garageCell.lbFirstDot.clipsToBounds = true
        garageCell.lbSecondDot.layer.cornerRadius = 2.5
        garageCell.lbSecondDot.clipsToBounds = true
        garageCell.pointsView.layer.cornerRadius = 25
        garageCell.pointsView.clipsToBounds = true
        garageCell.lbStatus.text = garagesList[indexPath.row].isClosed ? "Closed Now" : "Open Now"
        garageCell.lbStatus.textColor = Utility.getColor(value: garagesList[indexPath.row].isClosed ? Constants.COLOR_PRIMARY : Constants.SUCCESS_GREEN)
        
        let attributedText : NSMutableAttributedString = NSMutableAttributedString(string: "*****")
        let attribs = [NSAttributedString.Key.foregroundColor: Utility.getColor(value: Constants.THICK_BLUE)]
        attributedText.addAttributes(attribs, range: NSRange.init(location: 0, length: garagesList[indexPath.row].ratting))
        garageCell.lbRatting.attributedText = attributedText
        
       
        /*
        garageCell.mainView.layer.masksToBounds = false
        garageCell.mainView.layer.shadowColor = Utility.getColor(value: Constants.LIGHT_GRAY).cgColor
        garageCell.mainView.layer.shadowOpacity = 0.5
        garageCell.mainView.layer.shadowOffset = CGSize(width: -1, height: 1)
        garageCell.mainView.layer.shadowRadius = 5
        
        garageCell.mainView.layer.shadowPath = UIBezierPath(rect: garageCell.mainView.bounds).cgPath
        garageCell.mainView.layer.shouldRasterize = true
        garageCell.mainView.layer.rasterizationScale = UIScreen.main.scale
        */
        
        // loading image
        let imageUrl:NSURL = NSURL(string: garagesList[indexPath.row].imageUrl)!
        DispatchQueue.global(qos: .userInitiated).async
        {
            let imageData:NSData = NSData(contentsOf: imageUrl as URL)!
            DispatchQueue.main.async
            {
                garageCell.imgGarage.image = UIImage(data: imageData as Data)
                garageCell.imgGarage.contentMode = UIView.ContentMode.scaleAspectFill
            }
        }

        
        
        
        
        
        
        
    
        return garageCell
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        Logger.log(data: "OREINTATION CHANGED")
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: size.width - 30, height: 224)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        
//        if garagesList.count > 0
//        {
//            collectionView.reloadData()
//        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let garage = garagesList[indexPath.row]
        let helperViewController = self.storyboard?.instantiateViewController(withIdentifier: "HelperViewController") as! HelperViewController
        helperViewController.dataProvider = DataProvider(key: 7006 ,params: ["Garage":garage])
        self.present(helperViewController, animated: false, completion: nil)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: self.view.frame.width - 10, height: 230)
//        return size
//    }
    
   

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
