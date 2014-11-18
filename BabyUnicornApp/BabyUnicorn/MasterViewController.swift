//
//  MasterViewController.swift
//  BabyUnicorn
//
//  Created by Netlight on 09/11/14.
//  Copyright (c) 2014 Netlight Consulting AB. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var datasource = BabyUnicornDataSource()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }
    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let unicorn = datasource.unicornAtIndex(indexPath.row)
            (segue.destinationViewController as DetailViewController).babyUnicorn = unicorn
            }
        }
    }
    

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as BabyUnicornCell

        let unicorn = datasource.unicornAtIndex(indexPath.row)
                
        cell.textLabel.text = unicorn.firstName + " " + unicorn.lastName
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}

