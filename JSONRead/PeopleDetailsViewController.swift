//
//  PeopleDetailsViewController.swift
//  JSONRead
//
//  Created by Feifan Zhou on 7/20/14.
//  Copyright (c) 2014 Cups of Cocoa. All rights reserved.
//

import UIKit

class PeopleDetailsViewController: UITableViewController {
	var details: NSDictionary
	
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		details = NSDictionary()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
	init(style: UITableViewStyle) {
		details = NSDictionary()
		super.init(style: style)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.name()
    }

	func name() -> NSString {
		let fname: NSString = self.details["fname"] as NSString
		let lname: NSString = self.details["lname"] as NSString
		return "\(fname) \(lname)"
	}
    
	override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
		return 1
	}
	override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		let CellID: NSString = "Cell"
		var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellID) as? UITableViewCell
		if cell == nil {
			cell = UITableViewCell(style: .Value1, reuseIdentifier: CellID)
		}
		switch indexPath.row {
		case 0:
			cell!.textLabel.text = self.name()
			cell!.detailTextLabel.text = "Name"
		case 1:
			var email: NSString? = self.details["email"] as? NSString
			if !email {
				email = "No email"
			}
			cell!.textLabel.text = email
			cell!.detailTextLabel.text = "Email"
		case 2:
			cell!.textLabel.text = self.details["phone"] as NSString
			cell!.detailTextLabel.text = "Phone"
		default:
			break
		}
		return cell
	}
}
