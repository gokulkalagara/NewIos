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
    

    @IBOutlet weak var garageTypeCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var garagesList : [Garage]!
    var garageTypeList : [GarageType]!
    var previousType : Int = 0
    var previousIndexPath : IndexPath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garagesList = Utility.generateGarages()
        garageTypeList = Utility.generateGarageTypes()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let layoutType: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width - 30, height: 224)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        
        layoutType.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layoutType.itemSize = CGSize(width: 100, height: 100)
        layoutType.minimumInteritemSpacing = 15
        layoutType.minimumLineSpacing = 15
        layoutType.scrollDirection = UICollectionView.ScrollDirection.horizontal // .horizontal
        garageTypeCollectionView!.collectionViewLayout = layoutType
        
        
        if garageTypeList.count > 0
        {
            garageTypeCollectionView.reloadData()
        }
        if garagesList.count > 0
        {
            collectionView.reloadData()
        }

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return collectionView == self.garageTypeCollectionView ? garageTypeList.count : garagesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.collectionView // garage
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
                do
                {
                    let imageData:NSData = try NSData(contentsOf: imageUrl as URL)
                    DispatchQueue.main.async
                    {
                            garageCell.imgGarage.image = UIImage(data: imageData as Data)
                            garageCell.imgGarage.contentMode = UIView.ContentMode.scaleAspectFill
                    }
                }
                catch
                {
                    Logger.log(data: error)
                }
                
            }

            
            
            
        
            return garageCell
        }
        else // garage type
        {
            let garageTypeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GarageTypeCollectionViewCell", for: indexPath) as! GarageTypeCollectionViewCell
            garageTypeCell.lbType.text = garageTypeList[indexPath.row].name
            
            garageTypeCell.mainView.layer.cornerRadius = 5
            garageTypeCell.mainView.clipsToBounds = true
            garageTypeCell.lbSelected.layer.cornerRadius = 5
            garageTypeCell.lbSelected.clipsToBounds = true
            
            garageTypeCell.lbSelected.backgroundColor = Utility.getColor(value:  garageTypeList[indexPath.row].isSelected ? Constants.THICK_BLUE : Constants.WHITE)
            
            
            let imageUrl:NSURL = NSURL(string: garageTypeList[indexPath.row].imageUrl)!
            DispatchQueue.global(qos: .userInitiated).async
                {
                    do
                    {
                        let imageData:NSData = try NSData(contentsOf: imageUrl as URL)
                        DispatchQueue.main.async
                        {
                                garageTypeCell.imgType.image = UIImage(data: imageData as Data)
                                garageTypeCell.imgType.contentMode = UIView.ContentMode.scaleAspectFill
                        }
                    }
                    catch
                    {
                        Logger.log(data: error)
                    }
            }
            
            return garageTypeCell
            
        }
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
    
        Logger.log(data: "OREINTATION CHANGED")
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
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
        if collectionView == self.collectionView
        {
            let garage = garagesList[indexPath.row]
            let helperViewController = self.storyboard?.instantiateViewController(withIdentifier: "HelperViewController") as! HelperViewController
            helperViewController.dataProvider = DataProvider(key: 7006 ,params: ["Garage":garage])
            self.present(helperViewController, animated: false, completion: nil)
        }
        else
        {
            
            if previousType == indexPath.row
            {
                
            }
            else
            {
                garageTypeList[previousType].isSelected = false
                garageTypeList[indexPath.row].isSelected = true
                
//                previousIndexPath = IndexPath(row: previousType, section: 0)
//                self.garageTypeCollectionView.reloadItems(at: [indexPath,previousIndexPath])
//                previousType = indexPath.row
                
                
                //let garageTypeCell = garageTypeCollectionView.cellForItem(at: indexPath) as! GarageTypeCollectionViewCell
                //garageTypeCell.lbSelected.backgroundColor = Utility.getColor(value:  garageTypeList[indexPath.row].isSelected ? Constants.THICK_BLUE : Constants.WHITE)
                //previousType = indexPath.row
                
//                if collectionView.cellForItem(at: previousIndexPath) != nil
//                {
//
//                    let previousGarageTypeCell = collectionView.cellForItem(at: previousIndexPath) as! GarageTypeCollectionViewCell
//                        previousGarageTypeCell.lbSelected.backgroundColor = Utility.getColor(value:  garageTypeList[previousIndexPath.row].isSelected ? Constants.THICK_BLUE : Constants.WHITE)
//                        previousType = indexPath.row
//
//                }
//                else
//                {
//                    previousType = indexPath.row
//                    collectionView.reloadData()
//                }
                
            }
        }
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
