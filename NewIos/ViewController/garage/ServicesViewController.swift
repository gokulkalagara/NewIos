//
//  ServicesViewController.swift
//  NewIos
//
//  Created by Developer on 15/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    public var garageServicesList : [GarageService]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        garageServicesList = Utility.generateGarageServices()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: view.frame.width - 30, height: 130)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        
        if(garageServicesList.count > 0)
        {
            collectionView.reloadData()
        }

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return garageServicesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
            let serviceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCell", for: indexPath) as! ServiceCollectionViewCell
        
            serviceCell.mainView.layer.cornerRadius = 5
            serviceCell.mainView.clipsToBounds = true
        
            serviceCell.lbServiceName.numberOfLines = 2
            serviceCell.lbServiceName.sizeToFit()
        
            serviceCell.lbServiceName.text = garageServicesList[indexPath.row].OpCodeName
            serviceCell.lbPrice.text = "Rs. " + String(garageServicesList[indexPath.row].Price)
            serviceCell.lbContent.text = garageServicesList[indexPath.row].OpCodeContent
        
            serviceCell.imgStatus.image = serviceCell.imgStatus.image!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            serviceCell.imgStatus.tintColor = Utility.getColor(value: Constants.SUCCESS_GREEN)
        
        
            if garageServicesList[indexPath.row].Tag
            {
                serviceCell.lbTag.isHidden = false
                serviceCell.imgTag.isHidden = false
                
            
                serviceCell.lbTag.text = garageServicesList[indexPath.row].TagContent
                
                
                serviceCell.imgTag.image = serviceCell.imgTag.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                
                serviceCell.imgTag.tintColor = Constants.TAG_COLORS[Constants.TAG_COLORS.count < garageServicesList[indexPath.row].TagType ? Constants.TAG_COLORS.count - 1 : garageServicesList[indexPath.row].TagType]
            }
            else
            {
                serviceCell.lbTag.isHidden = true
                serviceCell.imgTag.isHidden = true
                
            }
        
        
        
        
        let imageUrl:NSURL = NSURL(string: garageServicesList[indexPath.row].ImageUrl)!
            DispatchQueue.global(qos: .userInitiated).async
            {
                    let imageData:NSData = NSData(contentsOf: imageUrl as URL)!
                    DispatchQueue.main.async
                    {
                            serviceCell.imgService.image = UIImage(data: imageData as Data)
                            serviceCell.imgService.contentMode = UIView.ContentMode.scaleAspectFill
                    }
            }
        
            
        
        
            return serviceCell
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        
        Logger.log(data: "OREINTATION CHANGED")
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: size.width - 30, height: 130)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout

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
