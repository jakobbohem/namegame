//
//  DetailViewController.swift
//  BabyUnicorn
//
//  Created by Netlight on 09/11/14.
//  Copyright (c) 2014 Netlight Consulting AB. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet var NLImage: UIImageView!

    var babyUnicorn: BabyUnicorn? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: BabyUnicorn = self.babyUnicorn {
            /*if let label = self.detailDescriptionLabel {
                label.text = detail.firstName
            }*/
            if let imageview = self.NLImage {
                imageview.image = detail.image
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

