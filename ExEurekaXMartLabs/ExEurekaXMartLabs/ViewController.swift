//
//  ViewController.swift
//  ExEurekaXMartLabs
//
//  Created by Thiago  Espindola Cury on 12/01/2018.
//  Copyright © 2018 Thiago  Espindola Cury. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        form
            +++ Section("Cadastro")
            
            <<< TextRow("nome"){ row in
                row.title = "Nome"
                row.placeholder = "Digite o seu nome"
            }
            
            <<< EmailRow("email"){ row in
                row.title = "Email"
                row.placeholder = "Digite seu email"
            }

            <<< PhoneRow("telefone"){
                $0.title = "Telefone"
                $0.placeholder = "Digite o seu número"
            }
        
            +++ Section("Data")
            <<< DateRow("data"){
                $0.title = "Data de nascimento"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
        
            +++ Section()
            <<< ButtonRow("Cadastrar") {
                (row: ButtonRow) -> Void in
                
                row.title = row.tag //Título do botão
                
                row.onCellSelection({ (cell, row) -> () in
                    
                    let rowNome: TextRow? = self.form.rowBy(tag: "nome")
                    let nome = rowNome?.value
                    
                    let rowEmail: EmailRow? = self.form.rowBy(tag: "email")
                    let email = rowEmail?.value
                    
                    let rowTelefone: PhoneRow? = self.form.rowBy(tag: "telefone")
                    let telefone = rowTelefone?.value

                    let rowData: DateRow? = self.form.rowBy(tag: "data")
                    let data = rowData?.value
                    
                    let msg = UIAlertController(title: "Relatório", message: "\(nome) \(email) \(telefone) \(data)", preferredStyle: UIAlertControllerStyle.alert)
                    msg.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(msg, animated: true, completion: nil)
                    
                }).cellSetup({ (cell, row) -> () in
                    cell.backgroundColor = UIColor.darkGray
                    cell.tintColor = UIColor.white
                })
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

