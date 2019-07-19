//
//  ViewController.swift
//  CollectionViewTwoStraws
//
//  Created by Suhaib AlMutawakel on 7/19/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    //    let ButtonImageView: [UIImage] = [
    //        UIImage (named:"EmptyBtn")!,

    var imagesArr = [UIImage]()
    var idArr = [String]()
    
    
    
    override func viewDidLoad() {
        
        imagesArr = [#imageLiteral(resourceName: "SponsorsButton"),#imageLiteral(resourceName: "SponsorsButton"),#imageLiteral(resourceName: "SponsorsButton"),#imageLiteral(resourceName: "SponsorsButton"),#imageLiteral(resourceName: "SponsorsButton"),#imageLiteral(resourceName: "SponsorsButton")]
        idArr = ["AgendaPage"]
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArr.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Button", for: indexPath) as? ButtonCell else {
            fatalError("Can't Access Button")
        }
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = imagesArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = idArr[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
}

