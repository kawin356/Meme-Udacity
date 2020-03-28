//
//  ShowMemeViewController.swift
//  Meme-Udacity
//
//  Created by Kittikawin Sontinarakul on 28/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class ShowMemeViewController: UIViewController {
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    var memeImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memeImageView.image = memeImage
    }
    
}
