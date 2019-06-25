//
//  AppDependencyContainer.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 25/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift

public class AppDependencyContainer : DependencyProvider, AppDependencyProvider{
    
    var reduxStore: Store<AppState> = Store(reducer: mainReducer, state: nil)
    
    func makeLaunchViewController() -> LaunchViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc          = storyboard.instantiateViewController(withIdentifier: "LaunchViewController") as! LaunchViewController

        let dependencyContainer     = LaunchDependencyContainer(store: reduxStore)
        
        vc.viewModel                = dependencyContainer.makeViewModel()
        
        vc.container                = dependencyContainer
        
        return vc 
        
    }
}
