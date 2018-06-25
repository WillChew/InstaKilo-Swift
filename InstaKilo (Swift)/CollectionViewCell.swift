//
//  CollectionViewCell.swift
//  InstaKilo (Swift)
//
//  Created by Will Chew on 2018-06-25.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit

class CollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    func displayContent(image:UIImage) {
        photoImageView.image = image
    }
    
}
