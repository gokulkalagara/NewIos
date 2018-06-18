//
//  DetailsViewController.swift
//  NewIos
//
//  Created by Developer on 15/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    
    var garageImages : [String]!
    
    public var garage : Garage!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lbUserRatting: UILabel!
    
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var lbGarageName: UILabel!
    
    @IBOutlet weak var lbGarageType: UILabel!
    
    @IBOutlet weak var lbRatting: UILabel!
    
    @IBOutlet weak var lbStatus: UILabel!
    
    @IBOutlet weak var lbAddress: UILabel!
    
    @IBOutlet weak var lbDot: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func setUp()
    {
        garageImages = Utility.generateGarageImages()
        
        let layoutType: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutType.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layoutType.itemSize = CGSize(width: garageImages.count>1 ? view.frame.width - 100 : view.frame.width - 30 , height: 150)
        layoutType.minimumInteritemSpacing = 15
        layoutType.minimumLineSpacing = 15
        layoutType.scrollDirection = UICollectionView.ScrollDirection.horizontal // .horizontal
        collectionView!.collectionViewLayout = layoutType
        
        if garageImages.count > 0
        {
            collectionView.reloadData()
        }
        
        lbUserRatting.layer.cornerRadius = 25
        lbUserRatting.clipsToBounds = true
        
        detailsView.layer.cornerRadius = 10
        detailsView.clipsToBounds = true
        
        lbDot.layer.cornerRadius = 2.5
        lbDot.clipsToBounds = true
        
        lbGarageName.text = garage.name
        lbUserRatting.text = String(garage.points)
        lbAddress.text = garage.address
        
        lbStatus.text = garage.isClosed ? "Closed Now" : "Open Now"
        lbStatus.textColor = Utility.getColor(value: garage.isClosed ? Constants.COLOR_PRIMARY : Constants.SUCCESS_GREEN)
        
        let attributedText : NSMutableAttributedString = NSMutableAttributedString(string: "*****")
        let attribs = [NSAttributedString.Key.foregroundColor: Utility.getColor(value: Constants.THICK_BLUE)]
        attributedText.addAttributes(attribs, range: NSRange.init(location: 0, length: garage.ratting))
        lbRatting.attributedText = attributedText
        
        
        
        
        
        
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        
        Logger.log(data: "OREINTATION CHANGED")
        let layoutType: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layoutType.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layoutType.itemSize = CGSize(width: garageImages.count>1 ? view.frame.width - 100 : view.frame.width - 30 , height: 150)
        layoutType.minimumInteritemSpacing = 15
        layoutType.minimumLineSpacing = 15
        layoutType.scrollDirection = UICollectionView.ScrollDirection.horizontal // .horizontal
        collectionView!.collectionViewLayout = layoutType
        
        //        if garagesList.count > 0
        //        {
        //            collectionView.reloadData()
        //        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return garageImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let garageImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GarageImageCollectionViewCell", for: indexPath) as! GarageImageCollectionViewCell
        garageImageCell.imgGarage.layer.cornerRadius = 10
        garageImageCell.imgGarage.clipsToBounds = true
        
        let imageUrl:NSURL = NSURL(string: garageImages[indexPath.row])!
        DispatchQueue.global(qos: .userInitiated).async
            {
                let imageData:NSData = NSData(contentsOf: imageUrl as URL)!
                DispatchQueue.main.async
                    {
                        garageImageCell.imgGarage.image = UIImage(data: imageData as Data)
                        garageImageCell.imgGarage.contentMode = UIView.ContentMode.scaleAspectFill
                }
        }
        
        return garageImageCell
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
