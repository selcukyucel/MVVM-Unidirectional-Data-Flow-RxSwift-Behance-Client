//
//  ProjectItemCell.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

class ProjectItemCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var model : ProjectCellItemModel!
    
    var isLoading: Bool {
        get { return activityIndicator.isAnimating }
        set {
            if newValue {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        } }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.projectImageView.layer.cornerRadius = 10
        self.projectImageView.layer.masksToBounds = true
        
    }
    
    
    func configure(data: ProjectCellItemModel) {
        
        self.model    = data
        
        projectNameLabel.text   = model.name

        let operation = NetworkImageOperation (string: model.imageURL)
        
        operation?.completionBlock = {
            DispatchQueue.main.async {
                
                self.isLoading = false
                if let image = operation?.image {
                    self.projectImageView.image = image
                }
                
            }
        }
        
        operation?.start()
        
    }
    
    
    
    override func prepareForReuse() {
        self.projectImageView.image = nil 
    }

}
