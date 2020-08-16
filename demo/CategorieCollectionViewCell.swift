//
//  CategorieCollectionViewCell.swift
//  demo
//
//  Created by Nguyen Trung Hieu on 8/16/20.
//  Copyright © 2020 Nguyễn Trung Hiếu. All rights reserved.
//

import UIKit

class CategorieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    class var reuseIdentifier: String {
        return "CollectionViewCellidentifier"
    }
    class var nibName: String {
        return "CollectionViewCell"
    }
    func configure(image: UIImage, label: String) {
        self.img.image = image
        self.lbl.text = label
    }

}
