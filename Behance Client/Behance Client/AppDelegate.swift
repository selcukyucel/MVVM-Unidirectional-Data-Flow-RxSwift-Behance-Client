//
//  AppDelegate.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 11/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let injectionContainer = AppDependencyContainer()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let launchVC                = injectionContainer.makeLaunchViewController()
        
        let navigationController    = UINavigationController()
        
        navigationController.viewControllers = [launchVC]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController  = navigationController
        
        /*
         
         Behance client to be
         I wanted to use/show different approaches in this first version which has been done quickly.
         Please read below to see what has been done, how it has been done.
         You will see what I will do for version 2 soon.
         
         Currently version 1
         - App has been developed to use different kind of approaches to create views, data flow, navigation flow, dependency injection.
         - Considered MVVM, RxSwift, Unidirectional Data Flow, Protocol Oriented approach to create views, data flow.
         
         LaunchViewController;
         - used Unidirectional Data Flow to observe state changes
         - used dispatch actions to update view or/and push/present views.
         
         ProfileViewController;
         - considered protocol oriented approach to create multiple type of collection view cells with Datasource, Delegates.
         
         //TODO:
         - change dependency injection (see. LaunchViewModel injection to LaunchViewController via dependency container.)
         
         
         ProjectViewController;
         - considered Rx way to populate collection view. Same protocol oriented approach to create multiple type of cells like in Profile View Controller except no datasource.
         - Viewmodel Input/Output; I have seen this approach one of the Pinterest engineers was explaning how their view model structure is. Liked it, used in one of my projects as well. One of my favorite approach using with RxSwift.
         
         //TODO:
         - change dependency injection
         
         
         TODO for version 2
         - Usecases for operations. (fetch,etc.) Currently higher functions to fetch data from files in Bundle.
         - Entire app works through Uni Data Flow
         - Refactor everything to RxSwift
         - ViewModels Input/Output style
         - Design / Styling
         - Behance API Connect
         - Projects & Creatives to Follow Views implementation
         
         */
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

