//
//  ViewController.swift
//  ExUIButtonMostrandoUIAlertController
//
//  Created by Thiago  Espindola Cury on 10/01/2018.
//  Copyright © 2018 Thiago  Espindola Cury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btAlert(_ sender: UIButton) {
        /* O UIAlertController vai aparecer ao clicar no botão */
        let msg = UIAlertController(title: "UIAlert", message: "Você clicou no botão!", preferredStyle: UIAlertControllerStyle.alert)
        msg.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(msg, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
