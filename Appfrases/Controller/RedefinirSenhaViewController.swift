//
//  RedefinirSenhaViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 30/04/21.
//

import UIKit
import Firebase

class RedefinirSenhaViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

   
    
    @IBAction func btRedefinirSenha(_ sender: Any) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            if error != nil{
                self.alert(title: "Ops! Algo deu errado.", message: "Dados incorretos, tente novamente!")
                return
//                print("Dados incorretos, tente novamente!")
                
            }else{
                
                

                
                self.alert(title: "Parabéns", message: "A redefinição de senha foi enviada no Email Cadastrado")
                
            }
        }
    }
    
    
}

