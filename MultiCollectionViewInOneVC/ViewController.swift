//
//  ViewController.swift
//  MultiCollectionViewInOneVC
//
//  Created by Md Khaled Hasan Manna on 6/11/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgCollectionView: UICollectionView!
    
    
    var imgDataDic = [String : [UIImage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgCollectionView.isPagingEnabled = true
        
        imgDataDic = [
            "bgImg": [#imageLiteral(resourceName: "Tangerine"),#imageLiteral(resourceName: "Honeydewmelon"),#imageLiteral(resourceName: "Blueberries"),#imageLiteral(resourceName: "Blackberry"),#imageLiteral(resourceName: "Soursop"),#imageLiteral(resourceName: "Carambola"),#imageLiteral(resourceName: "Gooseberries"),#imageLiteral(resourceName: "Lemon"),#imageLiteral(resourceName: "Mangosteen"),#imageLiteral(resourceName: "DragonFruit"),#imageLiteral(resourceName: "DragonFruit"),#imageLiteral(resourceName: "Avocado"),#imageLiteral(resourceName: "Pomegranate"),#imageLiteral(resourceName: "Sugarapple"),#imageLiteral(resourceName: "Blackberry"),#imageLiteral(resourceName: "Banana"),#imageLiteral(resourceName: "Pineapple"),#imageLiteral(resourceName: "Jujube"),#imageLiteral(resourceName: "Cherries"),#imageLiteral(resourceName: "Papaya")]
        
        
        ]
    }


}
extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let bgImg = imgDataDic["bgImg"] {
            return bgImg.count
            
        }
        return 0
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CollectionViewCell = self.bgCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        if let bgImg = imgDataDic["bgImg"]{
            cell.bgImgCell.image = bgImg[indexPath.row]
        }
        
        return cell
    }
    
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: bgCollectionView.frame.width, height: bgCollectionView.frame.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    
    
}
