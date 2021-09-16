//
//  DetailViewController.swift
//  Blinkist
//
//  Created by  Decagon on 26/07/2021.
//

// for the view controller we are sigueing into

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var seguedTitle: UILabel!
    @IBOutlet weak var seguedAuthor: UILabel!
    
    var newImage = UIImage()
    var titleHolder = ""
    var authorHolder = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = newImage
        seguedTitle.text = "\(titleHolder)"
        seguedAuthor.text = "\(authorHolder)"
    }
}
