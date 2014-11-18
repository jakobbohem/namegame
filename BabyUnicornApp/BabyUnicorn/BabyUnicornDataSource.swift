//
//  BabyUnicornDataSource.swift
//  BabyUnicorns
//
//  Created by Patrik Billgren on 2014-11-09.
//  Copyright (c) 2014 Patrik. All rights reserved.
//

import Foundation

class BabyUnicornDataSource {
    
    private var babyUnicorns : [BabyUnicorn] = [BabyUnicorn]()
    
    
    var count : Int {
        get {
            return babyUnicorns.count
        }
    }
    init () {
        if let filePath = NSBundle.mainBundle().pathForResource("BU", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: filePath) {
                var jsonObjects = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as [AnyObject]
                NSLog("%@", jsonObjects.description)
                for jsonObject in jsonObjects {
                    let dic = jsonObject as [NSObject : AnyObject]
                    let unicorn = BabyUnicorn(initDictionary: dic)
                    babyUnicorns.append(unicorn)
                    
                }
            } else {
                NSLog("Could not serialize to JSON")
            }
        } else {
            NSLog("File not Found")
            unicornWithFirstName("Name", andLastName: "LastName");
        }
    }
    
    func unicornAtIndex (index: Int) -> BabyUnicorn {
        return babyUnicorns[index]
    }
    
    func unicornWithFirstName(name : String, andLastName lastName: String) {
        println("hehe")
    }
}
