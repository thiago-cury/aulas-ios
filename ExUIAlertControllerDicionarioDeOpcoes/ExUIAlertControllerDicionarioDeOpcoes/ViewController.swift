//
//  ViewController.swift
//  ExUIAlertControllerDicionarioDeOpcoes
//
//  Created by Thiago  Espindola Cury on 10/01/2018.
//  Copyright © 2018 Thiago  Espindola Cury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let comidas = ["Pizza", "Pastel", "Sanduíche"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        /* O UIAlertController vai aparecer depois de carregar a tela */
        let msg = UIAlertController(title: "Escolha",
                                    message: "Escolha uma opção de lanche",
                                    preferredStyle: .alert)
        
        for c in self.comidas {
            msg.addAction(UIAlertAction(title: c.description, style: .default, handler: { (action) in
                print("você escolheu: "+action.title!)
            }))
        }
        
        msg.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: { (action) -> Void in }))
        
        self.present(msg, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
