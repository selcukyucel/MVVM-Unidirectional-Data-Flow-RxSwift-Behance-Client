//
//  ProjectDependencyContainer.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 26/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift

class ProjectDependencyContainer : ProjectViewDependencyProvider {
    var reduxStore: Store<AppState>
    
    init(store:Store<AppState>) {
        self.reduxStore = store
    }
    
    func makeProjectViewModel(screen: Observable<AuthScreen>, viewState: ProjectViewState) -> ProjectViewModel {
        
        return ProjectViewModel(screen: screen, viewState: Observable.just(viewState))
    }
    
    func makeProfileViewController(viewState: ProfileViewState) -> ProfileViewController {
        
        let profileVC   = Scene.profile.viewController() as! ProfileViewController
        
        let dependencyContainer = ProfileViewDependencyContainer(store: self.reduxStore)
        
        profileVC.viewModel     = dependencyContainer.makeProfileViewModel(screen: makeScreenObservable(), viewState: viewState)
        
        profileVC.container     = dependencyContainer
        
        return profileVC
    }
    
    func makeScreenObservable() -> Observable<AuthScreen> {
        return reduxStore.makeObservable(){ appState -> AuthScreen in
            return appState.screen
            }.distinctUntilChanged()
    }
}
