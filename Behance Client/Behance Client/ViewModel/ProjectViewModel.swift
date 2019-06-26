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
    
    let screen      : Observable<AuthScreen>
    let viewState   : Observable<ProjectViewState>
    
    let disposeBag  = DisposeBag()
    var cellItems   : [CellConfigurator] = []
    
    init(screen:Observable<AuthScreen>, viewState:Observable<ProjectViewState>) {
        self.screen     = screen
        self.viewState  = viewState
    }
    
    struct Input {
        let trigger : Driver<Void>
        let project : Project
    }
    
    struct Output {
        let title       : Driver<String>
        let datasource  : Driver<[SectionModel<String,CellConfigurator>]>
    }
    
    func transform(input: Input) -> Output {
        
        let title   = Driver<String>.just(input.project.name)
        
        let items   = setProjectItems(project: input.project)
        
        let data    = Driver.just([SectionModel(model: "", items: items)])
        
        return Output(title: title, datasource: data)
        
    }
    
    private func setProjectItems(project:Project) -> [CellConfigurator]{
        
        var items : [CellConfigurator]  = []
        
        let coverImage                  = ProjectCoverImageConfigurator.init(item: ProjectCoverImageModel(data: project))
        items.append(coverImage)
        
        let basicInfo                   = ProjectBasicInfoConfigurator.init(item: ProjectBasicInfoItemModel(data: project))
        items.append(basicInfo)
        
        let fields                      = ProjectFieldsConfigurator.init(item: ProjectFieldsModel(data: project))
        items.append(fields)
        
        let owners                      = ProjectOwnersConfigurator.init(item: ProjectOwnersModel(data: project))
        items.append(owners)
        
        cellItems                       = items
        
        return items
    }
    
}
