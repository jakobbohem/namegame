//
//  BabyUnicorn.swift
//  BabyUnicorns
//
//  Created by Patrik Billgren on 2014-11-03.
//  Copyright (c) 2014 Patrik. All rights reserved.
//

import Foundation
import UIKit

class BabyUnicorn {
    
    let firstName: String
    let lastName: String
    let email: String
    let telephone : String
    let levelName : String
    let roleName : String
    let username : String
    private let officeShortName : String
    var office : String {
        get {
            switch officeShortName {
            case "STO" :
                return "Stockholm"
            default :
                return officeShortName
            }
        }
    }
    
    var image : UIImage? {
        get {
            return UIImage(named: username + ".jpeg")
        }
    }

    init(initDictionary dic : [NSObject : AnyObject]) {
        self.firstName = dic["firstName"] as String
        self.lastName = dic["lastName"] as String
        self.levelName = dic["levelName"] as String
        self.officeShortName = dic["officeShortName"] as String
        self.roleName = dic["roleName"] as String
        self.username = dic["username"] as String
        
        let contactInfo = dic["contactInformation"] as [NSObject : AnyObject]
        if let telephone = contactInfo["telephone"] as? String {
            self.telephone = telephone
        } else {
            self.telephone = "nophone"
        }
        
        self.email = contactInfo["eMail"] as String
    }
    
}
