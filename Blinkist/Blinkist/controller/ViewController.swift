//
//  ViewController.swift
//  Blinkist
//
//  Created by  Decagon on 26/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataLoader: DataLoader = DataLoader()           //class instatiation method for both closure and delegate
    
    var JSONData : [JSONDatum]  = []                    //Empty array that data loads to
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLoader.delegate = self                      //for protocol so as to show on ViewController
        dataLoader.receiveData()                        //for protocol to call the function in DataLoader class
//        JSONData = dataLoader.userData                   //for closure
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JSONData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! infoCollectionViewCell
        
        cell.setUp(with: JSONData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let toSeguePage = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        toSeguePage?.newImage = UIImage(named: self.JSONData[indexPath.row].image)!
        toSeguePage?.titleHolder = self.JSONData[indexPath.row].title
        toSeguePage?.authorHolder = self.JSONData[indexPath.row].author
        self.navigationController?.pushViewController(toSeguePage!, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 350)
    }
}

extension ViewController: DataDelegate {
    func receiveData(_ data: [JSONDatum]) {             //EXTENSION TO IMPLEMENT DELEGATE
        self.JSONData = data
    }
}
