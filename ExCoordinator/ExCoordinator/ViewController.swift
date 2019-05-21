//
//  ViewController.swift
//  ExCoordinator
//
//  Created by Thiago  Espindola Cury on 20/05/2019.
//  Copyright © 2019 Thiago Cury. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    @IBAction func clickScreen1(_ sender: UIButton) {
        coordinator?.goToScreen1()
    }
    
    @IBAction func clickScreen2(_ sender: UIButton) {
        coordinator?.goToScreen2()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

