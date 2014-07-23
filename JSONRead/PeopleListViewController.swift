//
//  PeopleListViewController.swift
//  JSONRead
//
//  Created by Feifan Zhou on 7/19/14.
//  Copyright (c) 2014 Cups of Cocoa. All rights reserved.
//

import UIKit

class PeopleListViewController: UITableViewController {
	let JSON_FILE_URL: NSString = "https://raw.githubusercontent.com/Binpress/learn-objective-c-in-24-Days/master/Working%20With%20Web%20Data/JSONRead.json"
	var names: NSArray
	var data: NSArray
	
	init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
		self.names = []
		self.data = []
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	init(style: UITableViewStyle) {
		self.names = []
		self.data = []
		super.init(style: style)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "JSONRead"
		
		// Download JSON
		let url = NSURL(string: JSON_FILE_URL)
		let JSONData = NSData(contentsOfURL: url)
		let JSONResult = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as NSArray
		
		var _names: NSMutableArray = NSMutableArray()
		for item: AnyObject in JSONResult {
			let fname: NSString = item["fname"] as NSString
			let lname: NSString = item["lname"] as NSString
			let name: NSString = "\(fname) \(lname)"
			_names.addObject(name)
		}
		self.names = _names
		self.data = JSONResult
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
		return 1
	}
	override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return self.names.count
	}
	
	override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		let CellID: NSString = "Cell"
		var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellID) as? UITableViewCell
		if !cell {
			cell = UITableViewCell(style: .Default, reuseIdentifier: CellID)
		}
		cell!.textLabel.text = self.names[indexPath.row] as NSString
		return cell
	}

	override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
		let detailsController: PeopleDetailsViewController = PeopleDetailsViewController(style: .Grouped)
		detailsController.details = self.data[indexPath.row] as NSDictionary
		self.navigationController!.pushViewController(detailsController, animated: true)
	}
}
