//
//  ViewController.swift
//  ExCosmicMindMaterialDesign
//
//  Created by Thiago  Espindola Cury on 26/06/19.
//  Copyright © 2019 Thiago  Espindola Cury. All rights reserved.
//

import UIKit
import Material

class ViewController: UIViewController {
    
    fileprivate var emailField: ErrorTextField!
    fileprivate var passwordField: TextField!
    
    /// A constant to layout the textFields.
    fileprivate let constant: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = Color.grey.lighten5
        
        preparePasswordField()
        prepareEmailField()
        clickResponderButton()
        
    }
    
    fileprivate func clickResponderButton() {
        let btnAdd = RaisedButton(title: "Adicionar", titleColor: Color.blue.base)
        btnAdd.addTarget(self, action: #selector(clickResponderButton(button:)), for: .touchUpInside)
    
        view.layout(btnAdd).center(offsetY: +passwordField.bounds.height + 60).left(20).right(20)
        
    }
    
    /// Handle the resign responder button.
    @objc
    internal func clickResponderButton(button: UIButton) {
        
        //Mostrando os dados... Poderiam ser salvos, exportados para API, etc.
        print("email digitado: \(emailField.text)")
        print("senha digitada: \(passwordField.text)")
        
        emailField?.resignFirstResponder()
        passwordField?.resignFirstResponder()
        
        emailField.text = ""
        passwordField.text = ""
        
    }
    
}

extension ViewController {
    fileprivate func prepareEmailField() {
        emailField = ErrorTextField()
        emailField.placeholder = "Digite seu email"
        emailField.detail = "Email inválido"
        emailField.isClearIconButtonEnabled = true
        emailField.delegate = self
        emailField.isPlaceholderUppercasedWhenEditing = true
        emailField.placeholderAnimation = .hidden
        
        view.layout(emailField).center(offsetY: -passwordField.bounds.height - 80).left(20).right(20)
    }
    
    fileprivate func preparePasswordField() {
        passwordField = TextField()
        passwordField.placeholder = "Digite a sua senha"
        passwordField.detail = "No mínimo 8 caracteres"
        passwordField.clearButtonMode = .whileEditing
        passwordField.isVisibilityIconButtonEnabled = true
        
        // Setting the visibilityIconButton color.
        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
        
        view.layout(passwordField).center().left(20).right(20)
    }
}

extension ViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
}
