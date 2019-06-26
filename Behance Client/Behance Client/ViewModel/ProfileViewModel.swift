//
//  ProfileViewModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class ProfileViewModel {
    
    let screen      : Observable<AuthScreen>
    let viewState   : Observable<ProfileViewState>
    
    var dataSource : [[CellConfigurator]] = []
    
    init(screen: Observable<AuthScreen>, viewState:Observable<ProfileViewState>) {
        self.screen     = screen
        self.viewState  = viewState
    }
    
    func setup(user:User){
        
        let viewItems : [CellConfigurator] = [ProfileBasicConfigurator.init(item: ProfileBasicModel(data: user)),
                                              SocialConfigurator.init(item: SocialItemModel(data: user))
                                                ]
        
        dataSource.append(viewItems)
        
    }
    
    func addProjects(){
        
        if let projects = getProjects(){
            
            var items : [CellConfigurator] = []
            
            projects.forEach({ (project) in
                items.append(ProjectConfigurator.init(item: ProjectCellItemModel(data: project)))
            })
            
            dataSource.append(items)
        }
    }
}
