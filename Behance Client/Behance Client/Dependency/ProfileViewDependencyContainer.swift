//
//  ProfileViewDependencyContainer.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 25/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

class ProfileViewDependencyContainer : ProfileViewDependencyProvider {
    
    var reduxStore: Store<AppState>
    
    init(store:Store<AppState>) {
        self.reduxStore = store
    }
    
    func makeProfileViewModel(screen: Observable<AuthScreen>, viewState: ProfileViewState) -> ProfileViewModel {
        return ProfileViewModel(screen: screen, viewState: Observable.just(viewState))
    }
    
    func makeProjectViewController(viewState: ProjectViewState) -> ProjectViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        
        let vc                  = storyboard.instantiateViewController(withIdentifier: "ProjectViewController") as! ProjectViewController
        
        let dependencyContainer = ProjectDependencyContainer(store:self.reduxStore)
        
        vc.viewModel            = dependencyContainer.makeProjectViewModel(screen: makeScreenObservable(), viewState: viewState)
        
        vc.container            = dependencyContainer
        
        return vc
        
    }

    func makeScreenObservable() -> Observable<AuthScreen> {
        return reduxStore.makeObservable(){ appState -> AuthScreen in
            return appState.screen
            }.distinctUntilChanged()
    }
    
}
