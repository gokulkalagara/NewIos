//
//  SideMenuViewController.swift
//  NewIos
//
//  Created by Developer on 25/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    var iSwitchView : ISwitchView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var tvUserName: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var menuList : [Menu]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

        // Do any additional setup after loading the view.
    }
    
    func setUp()
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: view
            .frame.width - 85, height: 60)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        
        menuList = Utility.generateMenu()
        if menuList.count > 0
        {
            collectionView.reloadData()
        }
        
        profileView.layer.cornerRadius = 37.5
        profileView.clipsToBounds = true
        
        imgProfile.layer.cornerRadius = 34
        imgProfile.clipsToBounds = true
        
//        let shadowSize : CGFloat = 1.0
//        let shadowPath = UIBezierPath(rect: CGRect(x: 0,
//                                                   y: 2,
//                                                   width: self.mainView.frame.width + shadowSize,
//                                                   height: view.frame.height - 23 ))
//        self.mainView.layer.masksToBounds = false
//        self.mainView.layer.shadowColor = UIColor.black.cgColor
//        self.mainView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        self.mainView.layer.shadowOpacity = 0.4
//        self.mainView.layer.shadowPath = shadowPath.cgPath
        
        let imageUrl:NSURL = NSURL(string: Constants.AVATOR_IMAGE)!
        DispatchQueue.global(qos: .userInitiated).async
            {
                do
                {
                    let imageData:NSData = try NSData(contentsOf: imageUrl as URL)
                    DispatchQueue.main.async
                        {
                            self.imgProfile.image = UIImage(data: imageData as Data)
                            self.imgProfile.contentMode = UIView.ContentMode.scaleAspectFill
                    }
                }
                catch
                {
                    Logger.log(data: error)
                }
        }
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCollectionViewCell", for: indexPath) as! MenuItemCollectionViewCell
        
        menuCell.imgMenu.backgroundColor = Utility.getColor(value: Constants.LIGHT_GRAY)
        
        menuCell.imgMenu.layer.cornerRadius = 20
        menuCell.imgMenu.clipsToBounds = true
        
        menuCell.lbMenuName.text = menuList[indexPath.row].name
        
        return menuCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        iSwitchView.changeView(position: indexPath.row)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        
        Logger.log(data: "OREINTATION CHANGED")
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        layout.itemSize = CGSize(width: size.width - 85, height: 60)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        collectionView!.collectionViewLayout = layout
        
        let homeViewController =  self.parent as! HomeViewController
        homeViewController.sideMenu = false
        
        
//        let shadowSize : CGFloat = 1.0
//        let shadowPath = UIBezierPath(rect: CGRect(x: 0,
//                                                   y: 2,
//                                                   width: size.width + shadowSize - 50,
//                                                   height: size.height - 23 ))
//        self.mainView.layer.masksToBounds = false
//        self.mainView.layer.shadowColor = UIColor.black.cgColor
//        self.mainView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//        self.mainView.layer.shadowOpacity = 0.4
//        self.mainView.layer.shadowPath = shadowPath.cgPath
        
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
