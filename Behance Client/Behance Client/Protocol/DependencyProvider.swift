//
//  DependencyProvider.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 12/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

protocol DependencyProvider {
    var reduxStore : Store<AppState> { get }
    
}

protocol ProfileViewControllerFactory {
    func makeProfileViewController() -> ProfileViewController
}

protocol AppDependencyProvider  {
    func makeLaunchViewController() -> LaunchViewController
}

protocol LaunchDependencyProvider:ProfileViewControllerFactory {
    func makeViewModel()             -> LaunchViewModel
    func makeObservableViewState()   -> Observable<LaunchViewState>
    func makeScreenObservable()      -> Observable<AuthScreen>
    
}
