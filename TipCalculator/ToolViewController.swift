//
//  ToolViewController.swift
//  TipCalculator
//
//  Created by Jakob Rydén on 19/08/14.
//  Copyright (c) 2014 Jakob Rydén. All rights reserved.
//

//import Foundation
import UIKit

class ToolViewController: UIViewController { // should the viewController also be the data source??

    @IBOutlet var textView: UITextView!
    // 'view' implicitly defined here?
    @IBOutlet weak var mainImage: UIImageView!
    
    // buttons
    @IBOutlet weak var buttonTopLeft: UIButton!
    @IBOutlet weak var buttonBottomLeft: UIButton!
    @IBOutlet weak var buttonTopRight: UIButton!
    @IBOutlet weak var buttonBottomRight: UIButton!
    
    @IBOutlet var imageListener: UITapGestureRecognizer!
    


    // Model connection
    let tipCalc = TipCalculatorModel(total: 100, percent: 0.1)
    var possibleTips = Dictionary<Int, (tip:Double, total:Double)>()
    var sortedKeys:[Int] = []
    var images:[String] = [] // note: always use init values
    var friends:[String: String] = Dictionary<String,String>()//Dictionary<name:String: imageUrl:String>()
    var names: [String] = []
    var currentImageId = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup self:
        images+=["thor.png"]
        images+=["robert.png"]
//        
//        friends.add["Thor Bossoyt", "thor.png"]
//        friends+= ["Robert Bois", "robert.png"]
        
        populateNames()
        
        refreshUI();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        self.textView.text = "Detta är thor!"
        
        var index = Int(arc4random_uniform(UInt32(names.count)))
        buttonBottomLeft.setTitle(names[index], forState: UIControlState.Normal)
        index = Int(arc4random_uniform(UInt32(names.count)))
        buttonTopLeft.setTitle(names[index], forState: UIControlState.Normal)
        index = Int(arc4random_uniform(UInt32(names.count)))
        buttonBottomRight.setTitle(names[index], forState: UIControlState.Normal)
        index = Int(arc4random_uniform(UInt32(names.count)))
        buttonTopRight.setTitle(names[index], forState: UIControlState.Normal)
        
        // set up image click listener
        self.imageListener.numberOfTapsRequired = 1;
        
    }
    
    // UI Actions
    @IBAction func nameTopRight(sender: AnyObject) {
        //        debugInfo =
        println("replacing image \(mainImage.image)")
        // replace image
        cycleImage()
        
        
    }
    @IBAction func imageTapped(sender: AnyObject) {
        println("I got tapped")
    }
    
    @IBAction func clickedName(sender: UIButton) {
        println("clicked name: \(sender.titleLabel!.text)")
        
    }
    
    // Helper methods:
    func cycleImage() {
        currentImageId+=1
        currentImageId = currentImageId % images.count
        
        println("image id = \(currentImageId)");
        mainImage.image = UIImage(named: images[currentImageId]);
        
    }
    
    func populateNames() {
        self.names += ["Thor Bossuyt", "Jakob Ryden", "Robert Bois", "Anna Svensson", "Stefan Carlsson", "Ivan Milles", "Marie Fast", "Karin af Klintberg", "Bobbo Memme"]
    }
    
}