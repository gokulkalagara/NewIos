//
//  Utility.swift
//  NewIos
//
//  Created by Developer on 08/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

public class Utility: NSObject
{


    public static func getColor(value : String) -> UIColor
    {
        switch value
        {
        case Constants.COLOR_PRIMARY:
            return UIColor(red:0.77, green:0.09, blue:0.17, alpha:1.0)
            case Constants.LIGHT_GRAY: // #c4c4c4
            return UIColor(red:0.77, green:0.77, blue:0.77, alpha:1.0)
            case Constants.THICK_GRAY: // #505050
            return UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0)

        case Constants.NORMAL_ORGANE:
            return UIColor(red:1.00, green:0.34, blue:0.13, alpha:1.0)
            case Constants.TEXT_COLOR: // #404040
            return UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.0)

        case Constants.HASH_TEXT_COLOR: // #999999
            return UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)
            case Constants.THICK_BLUE:
            return UIColor(red:0.17, green:0.17, blue:0.58, alpha:1.0)
            case Constants.SUCCESS_GREEN:
            return UIColor(red:0.15, green:0.75, blue:0.38, alpha:1.0)
            case Constants.WHITE:
            return UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            case Constants.ICON_COLOR:
            return UIColor(red:0.32, green:0.32, blue:0.32, alpha:1.0)
            default:
            return UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
        }
    }
    
    
    // hide keyboard
    public static func hideKeyword(view: UIView)
    {
        view.endEditing(true)
    }
    
    // generate garages
    public static func generateGarages() -> [Garage] {
        var list : [Garage] = []
        let g1 : Garage = Garage()
        g1.name = "Asd Garage"
        g1.imageUrl = "https://media.gettyimages.com/photos/car-mechanic-using-tools-picture-id924923446"
        g1.distance = 50
        g1.points = 5.3
        g1.address = "TSS Towers, flat 617, Madhapur, Hyderabad"
        g1.ratting = 3
        g1.isClosed = false
        let g2 : Garage = Garage()
        g2.name = "DVV Garage"
        g2.imageUrl = "https://media.gettyimages.com/photos/cars-on-lifts-in-auto-repair-shop-picture-id188075212"
        g2.distance = 200
        g2.points = 9.3
        g2.address = "Madhapur, Hyderabad"
        g2.ratting = 2
        g2.isClosed = false
        let g3 : Garage = Garage()
        g3.name = "Maya Garage"
        g3.imageUrl = "https://media.gettyimages.com/photos/car-on-lift-in-auto-repair-shop-picture-id188075213"
        g3.distance = 500
        g3.points = 7.5
        g3.address = "Hi-Tech, Hyderabad"
        g3.ratting = 4
        g3.isClosed = true
    
        let g4 : Garage = Garage()
        g4.name = "Murali Garage"
        g4.imageUrl = "https://media.gettyimages.com/photos/tools-on-cart-in-auto-repair-shop-picture-id188075211"
        g4.distance = 900
        g4.points = 8.3
        g4.address = "Kondapur, Hyderabad"
        g4.ratting = 2
        g4.isClosed = false
        let g5 : Garage = Garage()
        g5.name = "Akbar Garage"
        g5.imageUrl = "https://media.gettyimages.com/photos/car-repair-shop-in-japan-picture-id669872522"
        g5.distance = 1500
        g5.points = 5.3
        g5.address = "Gachibowli, Hyderabad"
        g5.ratting = 3
        g5.isClosed = true
        let g6 : Garage = Garage()
        g6.name = "Sai Teja Garage"
        g6.imageUrl = "https://media.gettyimages.com/photos/auto-repair-shop-car-garage-picture-id176712668"
        g6.distance = 1550
        g6.points = 9.2
        g6.address = "Gachibowli, Hyderabad"
        g6.ratting = 0
        g6.isClosed = false

        list.append(g1)
        list.append(g2)
        list.append(g3)
        list.append(g4)
        list.append(g5)
        list.append(g6)

        return list
    
    }
    
    public static func generateGarageTypes() -> [GarageType]
    {
        var list : [GarageType] = []
        let gt = GarageType()
        gt.id = 0
        gt.name = "All"
        gt.imageUrl = "https://raw.githubusercontent.com/gokulkalagara/foodzone/all_sub/WarrousVGarages/app/src/main/res/drawable/all.png"
        gt.isSelected = true
        let gt1 = GarageType()
        gt1.id = 1
        gt1.name = "General"
        gt1.imageUrl = "http://devassets.warrous.com/Images/car_icons/general_service.png"
        let gt2 = GarageType()
        gt2.id = 2
        gt2.name = "Denting and Painting"
        gt2.imageUrl = "http://devassets.warrous.com/Images/car_icons/car_paint.png"
        let gt3 = GarageType()
        gt3.id = 1
        gt3.name = "Car Wash"
        gt3.imageUrl = "http://devassets.warrous.com/Images/car_icons/car_wash.jpg"
        let gt4 = GarageType()
        gt4.id = 1
        gt4.name = "Wheel Alignment"
        gt4.imageUrl = "http://devassets.warrous.com/Images/car_icons/car_breakdown.png"
        list.append(gt)
        list.append(gt1)
        list.append(gt2)
        list.append(gt3)
        list.append(gt4)
        return list

    }
    
    public static func generateGarageImages() -> [String]
    {
        let list : [String] = ["https://media.gettyimages.com/photos/car-mechanic-using-tools-picture-id924923446",
                               "https://media.gettyimages.com/photos/cars-on-lifts-in-auto-repair-shop-picture-id188075212",
                               "https://media.gettyimages.com/photos/car-on-lift-in-auto-repair-shop-picture-id188075213",
                               "https://media.gettyimages.com/photos/tools-on-cart-in-auto-repair-shop-picture-id188075211",
                               "https://media.gettyimages.com/photos/car-repair-shop-in-japan-picture-id669872522",
                               "https://i.pinimg.com/originals/3e/3e/14/3e3e14d932098c3c3140c419daaa61c6.jpg",
                               "https://media.gettyimages.com/photos/auto-repair-shop-car-garage-picture-id176712668",
                               "https://media.gettyimages.com/photos/car-service-procedure-picture-id522394158",
                               "https://media.gettyimages.com/photos/red-and-blue-car-racing-picture-id168959214"]
        return list
    }
    
    public static func generateGarageServices() -> [GarageService]
    {
        var list : [GarageService] = []
        let gs1 = GarageService()
        gs1.OpCodeName = "Oil Change"
        gs1.Price = 1500
        gs1.OpCodeContent = "Regularly changing your car's engine oil and filter are one of the most important things you can do to keep your car running well."
        gs1.ImageUrl = "https://media.gettyimages.com/photos/engine-oil-picture-id184832880"
        gs1.Tag = true
        gs1.TagContent = "Exclusive"
        gs1.TagType = 0
        let gs2 = GarageService()
        gs2.OpCodeName = "Replace AC Air Filter"
        gs2.Price = 3000
        gs2.OpCodeContent = "To change or clean the air filter in the central air system, first ensure that the system is off. Locate the filter inside of the furnace (or air handler for electric systems)."
        gs2.ImageUrl = "https://media.gettyimages.com/photos/automotive-air-filter-replacement-picture-id184348820"
        gs2.Tag = false
        let gs3 = GarageService()
        gs3.OpCodeName = "Car wash \nInterior / Exterior "
        gs3.Price = 600
        gs3.OpCodeContent = "With a damp cloth we dust the dash, steering wheel, and center console"
        gs3.ImageUrl = "https://media.gettyimages.com/photos/convertible-going-through-car-wash-picture-id154945530"
        gs3.Tag = true
        gs3.TagContent = "Promotive"
        gs3.TagType = 1
        let gs4 = GarageService()
        gs4.OpCodeName = "Engine Servicing"
        gs4.Price = 1500
        gs4.OpCodeContent = "A complete service history usually adds to the resale value of a vehicle"
        gs4.ImageUrl = "https://media.gettyimages.com/photos/car-engine-repair-picture-id641975348"
        gs4.Tag = false
        let gs5 = GarageService()
        gs5.OpCodeName = "Replace Side Mirrors"
        gs5.OpCodeContent = "Best quality with warranty"
        gs5.Price = 1100
        gs5.ImageUrl = "https://media.gettyimages.com/photos/side-view-of-a-luxus-car-picture-id157583605"
        gs5.Tag = false
        let gs6 = GarageService()
        gs6.OpCodeName = "Repairing Tires"
        gs6.Price = 700
        gs6.OpCodeContent = "Flat tire repair, tire patches and more"
        gs6.ImageUrl = "https://media.gettyimages.com/photos/tire-repairer-checking-the-tire-integrity-picture-id621978130"
        gs6.Tag = true
        gs6.TagContent = "10% Discount"
        gs6.TagType = 3
        let gs7 = GarageService()
        gs7.OpCodeName = "Door Service"
        gs7.OpCodeContent = "Maintaining your car doors and door parts is essential to their effortless function"
        gs7.Price = 500
        gs7.ImageUrl = "https://media.gettyimages.com/photos/auto-mechanic-picture-id598293869"
        gs7.Tag = false
        let gs8 = GarageService()
        gs8.OpCodeName = "Car Painting"
        gs8.OpCodeContent = "All types of colors available"
        gs8.Price = 5000
        gs8.ImageUrl = "https://media.gettyimages.com/photos/painting-table-on-white-color-picture-id510976011"
        gs8.Tag = true
        gs8.TagContent = "25% Discount"
        gs8.TagType = 2
        list.append(gs1)
        list.append(gs2)
        list.append(gs3)
        list.append(gs4)
        list.append(gs5)
        list.append(gs6)
        list.append(gs7)
        list.append(gs8)

        return list
    }
    
    public static func generateReviews() -> [Review]
    {
     
        var list : [Review] = []
        
        let r0 = Review()
        r0.FullName = "Kate Margarita"
        r0.Review = "You've done it again! Thank you for helping a damsel in distress, you repaired one tyre and replaced another even though I didn't have an appointment, thank you."
        r0.ImageUrl = "https://media.gettyimages.com/photos/young-woman-shopping-online-picture-id613241502"
        r0.Rating = 8
        r0.CreatedDt = "23 hours ago"
        
        let r1 = Review()
        r1.FullName = "Enay Bill"
        r1.Review = "Even though it was a really busy period for them they were able to fit in my repair when my car broke down. The team were very friendly and helpful and I'll definitely use Squire Furneaux Guildford again"
        r1.ImageUrl = "https://d2e70e9yced57e.cloudfront.net/wallethub/posts/29912/eric-klinenberg.jpg"
        r1.Rating = 9.3
        r1.CreatedDt = "1 day ago"
        
        let r2 =  Review()
        r2.FullName = "Henry David"
        r2.Review = "Had my MOT carried out here and have booked in for additional repairs to be carried out. Would definately recommend to friends and family"
        r2.ImageUrl = "https://www.cs.ox.ac.uk/files/8640//profile.jpg"
        r2.Rating = 7.8
        r2.CreatedDt = "3 days ago"
        
        let r3 = Review()
        r3.FullName = "Christin Curie"
        r3.Review = "Due to a misunderstanding the 2  tyres were fitted on the rear by mistake. However this was quickly rectified with the incorrectly removed tyres refitted and  tyres moved to the front. Have used Chemix for exhausts and tyres for years, always good value"
        r3.ImageUrl = "https://www.radioproject.org/wp-Review/uploads/2011/02/0711.jpg"
        r3.Rating = 9.5
        r3.CreatedDt = "18 days ago"
        
        let r4 =  Review()
        r4.FullName = "John Rayie"
        r4.Review = "First Class as usual"
        r4.ImageUrl = "https://edb-cdn-prod-tqgiyve.stackpathdns.com/players/icons/9e71815e-cabb-11e7-be93-0e6c723feec8.png"
        r4.Rating = 10
        r4.CreatedDt = "1 month ago"
        
        let r5 =  Review()
        r5.FullName = "Gates Johnson"
        r5.Review = "Avoid at any cost!!!"
        r5.ImageUrl = "http://www.unitytubes.com/wp-Review/uploads/2017/07/DAVIDO-4-150x150.png"
        r5.Rating = 4.5
        r5.CreatedDt = "2 months ago"
        
        let r6 =  Review()
        r6.FullName = "Catherine Ton"
        r6.Review = "Brilliant customer service, knowledgeable and friendly staff."
        r6.ImageUrl = "https://media.gettyimages.com/photos/photo-of-a-woman-using-smart-phone-picture-id647677346"
        r6.Rating = 8
        r6.CreatedDt = "2 months ago"
        
        list.append(r0)
        list.append(r1)
        list.append(r2)
        list.append(r3)
        list.append(r4)
        list.append(r5)
        list.append(r6)


        return list
    }
    
    
}
