//
//  ProjectCoverImageCell.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

class ProjectCoverImageCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var coverImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: ProjectCoverImageModel) {
        
        let operation = NetworkImageOperation(string: data.imageURL)
        
        operation?.completionBlock = {
            DispatchQueue.main.async {
                
                if let image = operation?.image {
                    self.coverImageView.image = image
                }
                
            }
        }
        
        operation?.start()
        
    }
    
    override func prepareForReuse() {
        coverImageView.image = nil
    }

}
