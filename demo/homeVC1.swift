//
//  homeVC1.swift
//  demo
//
//  Created by Nguyễn Trung Hiếu on 7/26/20.
//  Copyright © 2020 Nguyễn Trung Hiếu. All rights reserved.
//

import UIKit
import MapKit

class homeVC1: UIViewController, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
 

    
    @IBOutlet weak var saleScrollview: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var coll1: UICollectionView!
    @IBOutlet weak var coll2: UICollectionView!
    @IBOutlet weak var eventColl: UICollectionView!
    @IBOutlet weak var playColl: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    
    var imageArr = [UIImage] ()
    var image = [#imageLiteral(resourceName: "MovieIcon"),#imageLiteral(resourceName: "EventIcon"),#imageLiteral(resourceName: "PlaysIcon"),#imageLiteral(resourceName: "SportIcon"),#imageLiteral(resourceName: "ActivityIcon"),#imageLiteral(resourceName: "MonumIcon")]
    var text = ["Movie","Events","Plays","Sports","Activity","Monum"]
    var text1 = ["Bigil", "Kaithi", "Asuran", "Sarkar"]
    var image1 = [#imageLiteral(resourceName: "kaithi"), #imageLiteral(resourceName: "asuran"), #imageLiteral(resourceName: "bigil"), #imageLiteral(resourceName: "sakura")]
    var text2 = ["96","97","98","99"]
    var image2 = #imageLiteral(resourceName: "loveIcon")
    var imageEvent = [#imageLiteral(resourceName: "Halloween"), #imageLiteral(resourceName: "MusicDj"), #imageLiteral(resourceName: "SummerSound"), #imageLiteral(resourceName: "Taste")]
    var textEvent1 = ["Happy Halloween 2K19","Music DJ king monger Sert","Summer sounds festival","Happy Halloween 2K19"]
    var textEvent2 = ["Music show","Music show","Comedy show","Music show"]
    var imagePlay = [#imageLiteral(resourceName: "Alex"), #imageLiteral(resourceName: "Marry"), #imageLiteral(resourceName: "GoodPeople"), #imageLiteral(resourceName: "GoodMan")]
    var textPlay1 = ["Alex in wonderland","Marry poppins puffet show","Patrimandram special dewali","Happy Halloween 2K19"]
    var textPlay2 = ["Music show","Dibet show","Comedy show","Music show"]
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)

       self.saleScrollview.frame = CGRect(x:0, y:0, width:saleScrollview.frame.width, height:saleScrollview.frame.height)
       let scrollViewWidth:CGFloat = self.saleScrollview.frame.width
       let scrollViewHeight:CGFloat = self.saleScrollview.frame.height
       let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
       imgOne.image = UIImage(named: "Slide 1")
       let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
       imgTwo.image = UIImage(named: "Slide 2")
       let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
       imgThree.image = UIImage(named: "Slide 3")
    

       self.saleScrollview.addSubview(imgOne)
       self.saleScrollview.addSubview(imgTwo)
       self.saleScrollview.addSubview(imgThree)
       
       self.saleScrollview.contentSize = CGSize(width:self.saleScrollview.frame.width * 3, height:self.saleScrollview.frame.height)
       self.saleScrollview.delegate = self
       self.pageControl.currentPage = 0
        
        
        let nib = UINib(nibName: Coll2Cell.nibName,bundle: nil)
        coll2.register(nib, forCellWithReuseIdentifier: Coll2Cell.reuseIdentifier)
        let nib1 = UINib(nibName: CategorieCollectionViewCell.nibName, bundle: nil)
        coll1.register(nib1, forCellWithReuseIdentifier: CategorieCollectionViewCell.reuseIdentifier)
        let nib2 = UINib(nibName: EventCollectionViewCell.nibName, bundle: nil)
        eventColl.register(nib2, forCellWithReuseIdentifier: EventCollectionViewCell.reuseIdentifier)
        playColl.register(nib2, forCellWithReuseIdentifier: EventCollectionViewCell.reuseIdentifier)
        
}

    @objc func moveToNextPage (){
            
    let pageWidth:CGFloat = self.saleScrollview.frame.width
    let maxWidth:CGFloat = pageWidth * 3
    let contentOffset:CGFloat = self.saleScrollview.contentOffset.x
            
    var slideToX = contentOffset + pageWidth
        self.pageControl.currentPage += 1
    if  contentOffset + pageWidth == maxWidth
    {
        self.pageControl.currentPage = 0
        slideToX = 0
    }
    self.saleScrollview.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.saleScrollview.frame.height), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == coll1 {
            return 6
        }
        else if collectionView == coll2 {
            return 4
        }
        else if collectionView == eventColl{
            return 4
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == coll1 {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: CategorieCollectionViewCell.reuseIdentifier, for: indexPath) as! CategorieCollectionViewCell
            cell1.configure(image: image[indexPath.row], label: text[indexPath.row])
            return cell1
        }
        else if collectionView == coll2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Coll2Cell.reuseIdentifier, for: indexPath) as! Coll2Cell
            cell.configure(text1: text1[indexPath.row], image: image1[indexPath.row], image2: image2 , text2: text2[indexPath.row])
            return cell
        }
        else if collectionView == eventColl{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reuseIdentifier, for: indexPath) as! EventCollectionViewCell
            cell.configure(image: imageEvent[indexPath.row], label1: textEvent1[indexPath.row] , label2: textEvent2[indexPath.row])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reuseIdentifier, for: indexPath) as! EventCollectionViewCell
            cell.configure(image: imagePlay[indexPath.row], label1: textPlay1[indexPath.row], label2: textPlay2[indexPath.row])
            return cell
        }
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Coll2Cell.reuseIdentifier, for: indexPath) as! Coll2Cell
//        cell.configure(text1: text1[indexPath.row], image: image1[indexPath.row], image2: image2 , text2: text2[indexPath.row])
//        return cell
    }
}




