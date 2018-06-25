//
//  ViewController.swift
//  InstaKilo (Swift)
//
//  Created by Will Chew on 2018-06-25.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var skyArray : [UIImage] = []
    var everythingElseArray : [UIImage] = []
    var bothArray : [Array<UIImage>] = []
    @IBOutlet weak var collectionView: UICollectionView!
    let nameOfHeaders: [String] = ["Sky Pictures", "Others"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        skyArray.append(#imageLiteral(resourceName: "sky1"))
        skyArray.append(#imageLiteral(resourceName: "sky2"))
        skyArray.append(#imageLiteral(resourceName: "sky3"))
        skyArray.append(#imageLiteral(resourceName: "sky4"))
        
        
        everythingElseArray.append(#imageLiteral(resourceName: "other1"))
        everythingElseArray.append(#imageLiteral(resourceName: "other2"))
        everythingElseArray.append(#imageLiteral(resourceName: "other3"))
        everythingElseArray.append(#imageLiteral(resourceName: "other5"))
        everythingElseArray.append(#imageLiteral(resourceName: "other6"))
        everythingElseArray.append(#imageLiteral(resourceName: "other4"))
        
        bothArray.append(skyArray)
        bothArray.append(everythingElseArray)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return 1
        }
        if segmentedControl.selectedSegmentIndex == 1 {
            return 1
        } else {
            return self.bothArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            return self.skyArray.count
        }
        if segmentedControl.selectedSegmentIndex == 1 {
            return self.everythingElseArray.count
        } else {
        return self.bothArray[section].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let pictures = self.skyArray[indexPath.item]
            cell.photoImageView.image = pictures
            return cell
        }
        if segmentedControl.selectedSegmentIndex == 1 {
            let pictures = self.everythingElseArray[indexPath.item]
            cell.photoImageView.image = pictures
            return cell
        } else {
            
            let pictures = self.bothArray[indexPath.section][indexPath.item]
            cell.photoImageView.image = pictures
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "PhotoHeader", for: indexPath) as! PhotoHeader
            if (segmentedControl.selectedSegmentIndex == 0 ) {
                headerView.label.text = nameOfHeaders[0]
            }
            if (segmentedControl.selectedSegmentIndex == 1) {
                headerView.label.text = nameOfHeaders[1]
            }
            else {
                let headerString = nameOfHeaders[indexPath.section]
                let title = headerString
                headerView.label.text = title
            }
            
            reusableView = headerView
        }
        return reusableView
    }

    @IBAction func buttonPressed(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            self.collectionView.reloadData()
        }
        if segmentedControl.selectedSegmentIndex == 1 {
            self.collectionView.reloadData()
        }
    }
}

