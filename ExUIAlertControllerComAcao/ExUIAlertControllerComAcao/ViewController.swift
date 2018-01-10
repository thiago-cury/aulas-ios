//
//  ViewController.swift
//  ExUIAlertControllerComAcao
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

    override func viewDidAppear(_ animated: Bool) {
        
        /* O UIAlertController vai aparecer depois de carregar a tela */
        let msg = UIAlertController(title: "Alert", message: "Mas ah, UIAlert com ação. Escolha uma opção!?!", preferredStyle: UIAlertControllerStyle.alert)
        
        msg.addAction(UIAlertAction(title: "Sim", style: UIAlertActionStyle.default, handler: { action in
            print("Você clicou na opção sim")
        }))
        
        msg.addAction(UIAlertAction(title: "Não", style: UIAlertActionStyle.cancel, handler: { action in
            print("Você clicou na opção não")
        }))
        
        msg.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.destructive, handler: { action in
            print("Você clicou na opção cancelar")
        }))

        self.present(msg, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
