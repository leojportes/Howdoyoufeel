//
//  LoginViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 29/04/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    var auth:Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
    }

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        }
    

    
    @IBAction func btEntrar(_ sender: UIButton) {
        let email:String = self.emailTextField.text ?? ""
        let senha:String = self.senhaTextField.text ?? ""
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let novoViewController = storyBoard.instantiateViewController(withIdentifier: "ViewViaCodigo")
        
        self.auth?.signIn(withEmail: email, password: senha, completion: { (usuario, error) in
            if error != nil{
                self.alert(title: "Ops! Algo deu errado.", message: "Dados incorretos, tente novamente!")
                print("Dados incorretos, tente novamente!")
                
            }else{
//                self.alert(title: "Parabéns", message: "Login realizado com Sucesso!")
                self.present(novoViewController, animated: true, completion: nil)
               
                print("Login feito com Sucesso!")
                
            }
        })
    }
    
    
}

