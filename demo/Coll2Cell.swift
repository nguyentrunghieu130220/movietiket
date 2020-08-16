//
//  Coll2Cell.swift
//  demo
//
//  Created by Nguyễn Trung Hiếu on 8/3/20.
//  Copyright © 2020 Nguyễn Trung Hiếu. All rights reserved.
//

import UIKit

class Coll2Cell: UICollectionViewCell {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    class var reuseIdentifier: String {
        return "CollectionViewCellidentifier"
    }
    class var nibName: String {
        return "Coll2Cell"
    }
    func configure(text1:String,image:UIImage?,image2:UIImage?,text2:String){
        self.img1.image = image
        self.lbl1.text = text1
        self.img2.image = image2
        self.lbl2.text = text2
    }
}
