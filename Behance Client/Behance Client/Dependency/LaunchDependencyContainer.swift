//
//  LaunchDependencyContainer.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 12/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

class LaunchDependencyContainer: LaunchDependencyProvider {
    
    var store : Store<AppState>!
    
    init(store:Store<AppState>) {
        self.store      = store
    }
    
    func makeViewModel() -> LaunchViewModel {
        
        return LaunchViewModel(screen: makeScreenObservable())
    }
    
    func makeObservableViewState() -> Observable<LaunchViewState> {
        return store.makeObservable(){
            appState in
            return appState.screen
            }.mapUntilNil{ screen in
                return LaunchViewState(screen: .none)
        }.distinctUntilChanged()
    }
    
    func makeScreenObservable() -> Observable<AuthScreen> {
        return store.makeObservable(){ appState -> AuthScreen in
            return appState.screen
        }.distinctUntilChanged()
    }
    
    func makeProfileViewController(viewState: ProfileViewState) -> ProfileViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let profileVC   = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        let dependencyContainer = ProfileViewDependencyContainer(store: self.store)
        
        profileVC.viewModel     = dependencyContainer.makeProfileViewModel(screen: makeScreenObservable(), viewState: viewState)
        
        profileVC.container     = dependencyContainer
        
        return profileVC
    }
    
}
