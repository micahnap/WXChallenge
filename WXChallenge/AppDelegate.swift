//
//  AppDelegate.swift
//  WXChallenge
//
//  Created by Micah Napier on 29/4/20.
//  Copyright © 2020 Micah Napier. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  private lazy var coordinator: Coordinator = {
    let coordinator = Coordinator()
    return coordinator
  }()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    
    window.rootViewController = coordinator.rootViewController
    window.makeKeyAndVisible()
    return true
  }


}

