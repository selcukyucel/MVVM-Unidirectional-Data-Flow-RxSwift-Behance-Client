//
//  ProfileViewModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation

class ProfileViewModel{
    
    var dataSource : [[CellConfigurator]] = []
    
    var user : User?{
        didSet {
            guard user != nil else {
                return
            }
            
            setup()
        }
    }
    
    var projects : [Project]?{
        didSet {
            guard projects != nil else {
                return
            }
            
            addProjects()
        }
    }
    
    
    
    func setup(){
        
        let viewItems : [CellConfigurator] = [ProfileBasicConfigurator.init(item: ProfileBasicModel(data: user!)),
                                              SocialConfigurator.init(item: SocialItemModel(data: user!))
                                                ]
        
        dataSource.append(viewItems)
        
    }
    
    func addProjects(){
        
        var items : [CellConfigurator] = []
        
        projects?.forEach({ (project) in
            items.append(ProjectConfigurator.init(item: ProjectCellItemModel(data: project)))
        })
        
        dataSource.append(items)
        
    }
    
}
