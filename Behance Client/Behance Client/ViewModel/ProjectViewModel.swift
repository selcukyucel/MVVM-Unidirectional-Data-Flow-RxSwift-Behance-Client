//
//  ProjectViewModel.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import RxCocoa

final class ProjectViewModel : ViewModelType {
 
    var project     : Project!
    var cellItems   : [CellConfigurator] = []
    
    init() {
        if let project = getProject() {
            self.project = project
        }
    }
    
    let disposeBag  = DisposeBag()
    
    struct Input {
        let trigger : Driver<Void>
    }
    
    struct Output {
        let title       : Driver<String>
        let datasource  : Driver<[SectionModel<String,CellConfigurator>]>
    }
    
    func transform(input: ProjectViewModel.Input) -> ProjectViewModel.Output {
        
        let title   = Driver<String>.just(self.project.name)
        
        let items   = setItems()
        
        let data    = Driver.just([SectionModel(model: "", items: items)])
        
        return Output(title: title, datasource: data)
        
    }
    
    private func setItems() -> [CellConfigurator]{
        
        var items : [CellConfigurator]  = []
        
        let coverImage                  = ProjectCoverImageConfigurator.init(item: ProjectCoverImageModel(data: self.project))
        items.append(coverImage)
        
        let basicInfo                   = ProjectBasicInfoConfigurator.init(item: ProjectBasicInfoItemModel(data: self.project))
        items.append(basicInfo)
        
        let fields                      = ProjectFieldsConfigurator.init(item: ProjectFieldsModel(data: self.project))
        items.append(fields)
        
        let owners                      = ProjectOwnersConfigurator.init(item: ProjectOwnersModel(data: self.project))
        items.append(owners)
        
        cellItems                       = items
        
        return items
    }
    
}
