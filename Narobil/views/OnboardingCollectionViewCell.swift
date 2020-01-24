//
//  OnboardingCollectionViewCell.swift
//  Narobil
//
//  Created by Dharmendria on 21/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import UIKit


class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    func configure(image: UIImage)
    {
        slideImageView.image = image
    }
}
