//
//  ProjectOwnerCell.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

class ProjectOwnerCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.makeRounded()
        
    }
    
    func configure(user:User){
        
        nameLabel.text = user.firstName
        
        if let profilePicture = user.profilePicture {
            let operation = NetworkImageOperation(string: profilePicture)
            
            operation?.completionBlock = {
                DispatchQueue.main.async {
                    
                    if let image = operation?.image {
                        self.profileImageView.image = image
                    }
                    
                }
            }
            
            operation?.start()
        }
        
        
        
    }
    
    override func prepareForReuse() {
        profileImageView.image = nil
    }

}
