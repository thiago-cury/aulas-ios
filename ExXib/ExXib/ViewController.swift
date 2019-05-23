//
//  ViewController.swift
//  ExXib
//
//  Created by Thiago  Espindola Cury on 22/05/2019.
//  Copyright © 2019 Thiago Cury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var captionableImageView: CaptionableImageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        captionableImageView.caption = "ai sim"
        captionableImageView.image = UIImage(named: "person1")
    }
}
