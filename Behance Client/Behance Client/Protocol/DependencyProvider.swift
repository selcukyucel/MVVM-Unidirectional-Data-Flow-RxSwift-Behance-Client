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
    func makeProfileViewController(viewState:ProfileViewState) -> ProfileViewController
}

protocol ProfileViewModelFactory {
    func makeProfileViewModel(screen: Observable<AuthScreen>, viewState:ProfileViewState) -> ProfileViewModel
}

protocol AppDependencyProvider  {
    func makeLaunchViewController() -> LaunchViewController
}

protocol LaunchDependencyProvider:ProfileViewControllerFactory, ScreenObservable {
    func makeObservableViewState()   -> Observable<LaunchViewState> 
}

protocol ScreenObservable {
    func makeScreenObservable()      -> Observable<AuthScreen>
}

protocol ProjectViewControllerFactory {
    func makeProjectViewController(viewState:ProjectViewState) -> ProjectViewController
}

protocol ProjectViewModelFactory {
    func makeProjectViewModel(screen: Observable<AuthScreen>, viewState:ProjectViewState) -> ProjectViewModel
}

protocol ProfileViewDependencyProvider : ProfileViewModelFactory, ProjectViewControllerFactory, DependencyProvider, ScreenObservable {
    
}

protocol ProjectViewDependencyProvider : DependencyProvider, ProjectViewModelFactory, ProfileViewControllerFactory, ScreenObservable {
    
}


