//
//  AppDelegate.swift
//  JSONRead
//
//  Created by Feifan Zhou on 7/19/14.
//  Copyright (c) 2014 Cups of Cocoa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
		// Override point for customization after application launch.
		self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
		
		var controller: UIViewController = PeopleListViewController(style: .Plain)
		var navController: UINavigationController = UINavigationController(rootViewController: controller)
		
		self.window!.rootViewController = navController
		self.window!.makeKeyAndVisible()
		return true
	}
}
