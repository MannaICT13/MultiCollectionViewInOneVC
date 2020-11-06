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
    
    @IBOutlet weak var forgCollectionView: UICollectionView!
    
    var imgDataDic = [String : [UIImage]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgCollectionView.isPagingEnabled = true
        
        imgDataDic = [
            "bgImg": [#imageLiteral(resourceName: "DragonFruit"),#imageLiteral(resourceName: "DragonFruit"),#imageLiteral(resourceName: "Avocado"),#imageLiteral(resourceName: "Pomegranate"),#imageLiteral(resourceName: "Sugarapple"),#imageLiteral(resourceName: "Blackberry"),#imageLiteral(resourceName: "Banana"),#imageLiteral(resourceName: "Pineapple"),#imageLiteral(resourceName: "Jujube"),#imageLiteral(resourceName: "Cherries"),#imageLiteral(resourceName: "Papaya")],
            "forgImg": [#imageLiteral(resourceName: "Mandarin"),#imageLiteral(resourceName: "Pineapple"),#imageLiteral(resourceName: "Feijoa"),#imageLiteral(resourceName: "Pear"),#imageLiteral(resourceName: "Papaya"),#imageLiteral(resourceName: "Watermelon"),#imageLiteral(resourceName: "Cherries"),#imageLiteral(resourceName: "Passionfruit")]
        
        
        ]
    }


}
extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bgCollectionView{
            
            if let bgImg = imgDataDic["bgImg"] {
                return bgImg.count
                
            }
            
        }
        if collectionView == forgCollectionView{
            if let forgImg = imgDataDic["forgImg"]{
                return forgImg.count
            }
        }
        
        return 0
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CollectionViewCell = self.bgCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        if collectionView == bgCollectionView{
            
            if let bgImg = imgDataDic["bgImg"]{
                      cell.bgImgCell.image = bgImg[indexPath.row]
                  }
            
        }
        if collectionView ==  forgCollectionView{
            
            if let forgImg = imgDataDic["forgImg"]{
                cell.bgImgCell.image = forgImg[indexPath.row]
            }
        }
        
      
        
        return cell
    }
    
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView ==  bgCollectionView{
            
            return CGSize(width: bgCollectionView.frame.width, height: bgCollectionView.frame.height)
        }
        if collectionView == forgCollectionView{
            
         return CGSize(width: bgCollectionView.bounds.width/3-4, height: bgCollectionView.bounds.height/3-4)
        }
        
        return CGSize(width: 0.0, height: 0.0)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         if collectionView == forgCollectionView{
                   
                return 4
               }
        
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == forgCollectionView{
                   
                return 4
               }
        return 0
    }

    
    
    
}
