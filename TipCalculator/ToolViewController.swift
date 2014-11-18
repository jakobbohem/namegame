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
    @IBOutlet var imageListener: UITapGestureRecognizer!
    @IBAction func imageTapped(sender: AnyObject) {
        print("I got tapped")
    }


    // Model connection
    let tipCalc = TipCalculatorModel(total: 100, percent: 0.1)
    var possibleTips = Dictionary<Int, (tip:Double, total:Double)>()
    var sortedKeys:[Int] = []
    var imageId:String = "" // note: always use init values

    override func viewDidLoad() {
        super.viewDidLoad()

        // save original image id
        imageId = mainImage.image!.description

        refreshUI();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//  OBJ>c
//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
//    singleTap.numberOfTapsRequired = 1;
//    [preArrowImage setUserInteractionEnabled:YES];
//    [preArrowImage addGestureRecognizer:singleTap];
//    
//    -(void)tapDetected{
//    NSLog(@"single Tap on imageview");
//    
//    }
    
    
    func refreshUI() {
        self.textView.text = "Detta är thor!"
        print("h'r 'r thor")
        // set up image click listener
        self.imageListener.numberOfTapsRequired = 1;
        
    }
    
    // UI Actions
    @IBAction func nameTopRight(sender: AnyObject) {
        //        debugInfo =
        print("replacing image \(mainImage.image)")
        // replace image
        if(mainImage.image?.description == self.imageId) {
            mainImage.image = UIImage(named: "robert.png")
        }
        else {
            mainImage.image = UIImage(named: "thor.png")
        }
        
    }
    
}