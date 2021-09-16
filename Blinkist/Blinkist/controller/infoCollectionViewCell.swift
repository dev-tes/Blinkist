//
//  infoCollectionViewCell.swift
//  Blinkist
//
//  Created by  Decagon on 27/07/2021.
//

import UIKit

class infoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var bookNAme: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookType: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    func setUp(with detailsOfAuthor: JSONDatum){
        imageOutlet.image = UIImage(named: detailsOfAuthor.image)
        bookNAme.text = detailsOfAuthor.title
        bookAuthor.text = detailsOfAuthor.author
        bookType.text = detailsOfAuthor.bookType
        duration.text = detailsOfAuthor.jsonDatumDescription
    }
}
