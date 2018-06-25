//
//  ReviewsViewController.swift
//  NewIos
//
//  Created by Developer on 15/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class ReviewsViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let reviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCollectionViewCell", for: indexPath) as! ReviewCollectionViewCell
        
        reviewCell.lbRating.text = String( reviewList[indexPath.row].Rating ) + "/10"
        reviewCell.lbUserName.text = reviewList[indexPath.row].FullName
        reviewCell.lbReview.text = reviewList[indexPath.row].Review
        reviewCell.lbTimeAgo.text = reviewList[indexPath.row].CreatedDt
        
        reviewCell.mainView.layer.cornerRadius = 5
        reviewCell.mainView.clipsToBounds = true
        
        reviewCell.imgUser.layer.cornerRadius = 32.5
        reviewCell.imgUser.clipsToBounds = true
        
        
        let imageUrl:NSURL = NSURL(string: reviewList[indexPath.row].ImageUrl)!
        DispatchQueue.global(qos: .userInitiated).async
        {
            do
            {
                let imageData:NSData = try NSData(contentsOf: imageUrl as URL)
                DispatchQueue.main.async
                {
                        reviewCell.imgUser.image = UIImage(data: imageData as Data)
                        reviewCell.imgUser.contentMode = UIView.ContentMode.scaleAspectFill
                }
            }
            catch
            {
                Logger.log(data: error)
            }
        }
        
        
        
        
        return reviewCell
        
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var reviewList: [Review]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewList = Utility.generateReviews()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: view.frame.width - 30, height: 130)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        
        if reviewList.count > 0
        {
            collectionView.reloadData()
        }
        

        // Do any additional setup after loading the view.
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
