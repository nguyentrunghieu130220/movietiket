//
//  EventCollectionViewCell.swift
//  demo
//
//  Created by Nguyen Trung Hieu on 8/16/20.
//  Copyright © 2020 Nguyễn Trung Hiếu. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    
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
    func configure(image: UIImage, label1: String, label2: String) {
        self.img.image = image
        self.lbl1.text = label1
        self.lbl2.text = label2
    }

}
