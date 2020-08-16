//
//  CollectionViewCell.swift
//  demo
//
//  Created by Nguyễn Trung Hiếu on 7/29/20.
//  Copyright © 2020 Nguyễn Trung Hiếu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblImg: UILabel!
    
  
    func configure(with imgText: String) {
        lblImg.text = imgText
    }
    func image(with image: UIImage)  {
        imgView.image  = image
    }
   
}
