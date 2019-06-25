//
//  ProjectFieldsCell.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

class ProjectFieldsCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var fieldsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: ProjectFieldsModel) {
        
        var fields = ""
        
        data.fields.forEach { (field) in
            
            fields.append(contentsOf: field)
            fields.append(contentsOf: " / ")
            
        }
        
        fieldsLabel.text = fields
        
    }

}
