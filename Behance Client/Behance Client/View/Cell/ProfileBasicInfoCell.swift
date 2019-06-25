//
//  ProfileBasicInfoCell.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

class ProfileBasicInfoCell: UICollectionViewCell, ConfigurableCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.makeRounded()
        
    }
    
    func configure(data: ProfileBasicModel) {
        
        fullNameLabel.text   = data.fullName
        countryLabel.text    = data.location
        
        downloadWithUrlSession(imageURL: data.imageURL)
        
    }
    
    override func prepareForReuse() {
        self.profileImageView.image = nil
    }
    
    private func downloadWithUrlSession(imageURL:String) {
        
        if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                
                guard let self = self, let data = data, let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    self.profileImageView.image = UIImage(data: data)
                }
                
                }.resume()
        }
    }

}
