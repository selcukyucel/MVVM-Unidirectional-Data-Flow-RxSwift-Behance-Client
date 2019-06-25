//
//  ProjectBasicInfoCell.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

class ProjectBasicInfoCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: ProjectBasicInfoItemModel) {
        
        projectNameLabel.text   = "Project Name"
        infoLabel.text          = data.name
    }

}
