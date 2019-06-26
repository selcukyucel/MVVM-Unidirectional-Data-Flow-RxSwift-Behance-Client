//
//  CollectionCellConfigurator.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

typealias ProfileBasicConfigurator          = CollectionCellConfigurator<ProfileBasicInfoCell, ProfileBasicModel>
typealias AnyInfoConfigurator               = CollectionCellConfigurator<AnyInfoCell, User>
typealias SocialConfigurator                = CollectionCellConfigurator<SocialCell, SocialItemModel>
typealias ProjectConfigurator               = CollectionCellConfigurator<ProjectItemCell, ProjectCellItemModel>
typealias ProjectCoverImageConfigurator     = CollectionCellConfigurator<ProjectCoverImageCell, ProjectCoverImageModel>
typealias ProjectBasicInfoConfigurator      = CollectionCellConfigurator<ProjectBasicInfoCell, ProjectBasicInfoItemModel>
typealias ProjectFieldsConfigurator         = CollectionCellConfigurator<ProjectFieldsCell, ProjectFieldsModel>
typealias ProjectOwnersConfigurator         = CollectionCellConfigurator<ProjectOwnersCell, ProjectOwnersModel>



class CollectionCellConfigurator<CellType:ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType : UICollectionViewCell {
    
    static var reuseID: String { return String(describing: CellType.self) }
    
    let item : DataType
    var cell : CellType!
    
    init(item:DataType){
        self.item = item
    }
    
    func configure(cell: UIView) {
        
        self.cell = cell as? CellType
        
        self.cell.configure(data: item)
        
    }
    
    func size(ofCell collectionView: UICollectionView) -> CGSize {
        
        let width = collectionView.bounds.width
        
        if type(of: item) == ProfileBasicModel.self{
            return CGSize(width: width, height: width * 0.277)
        }else if type(of: item) == SocialItemModel.self {
            return CGSize(width: width, height: width * 0.16)
        }else if type(of: item) == ProjectCellItemModel.self{
            let cellWidth = (width - 40) / 2
            return CGSize(width: cellWidth, height: cellWidth * 1.39)
        }else if type(of: item) == ProjectCoverImageModel.self {
            return CGSize(width: width, height: width * 0.666)
        }else if type(of: item) == ProjectBasicInfoItemModel.self {
            return CGSize(width: width, height: width * 0.176)
        }else if type(of: item) == ProjectFieldsModel.self {
            return CGSize(width: width, height: width * 0.13)
        }else if type(of: item) == ProjectOwnersModel.self {
            return CGSize(width: width, height: width * 0.29)
        }
        
        return CGSize(width: width, height: 20)
    }
    
    func view() -> UIView {
        return self.cell
    }
}
