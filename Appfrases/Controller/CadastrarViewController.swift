//
//  LoginViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 29/04/21.
//

import UIKit
import Firebase


class CadastrarViewController: UIViewController {
    
    @IBOutlet weak var emailcadastrarTextField: UITextField!
    @IBOutlet weak var senhacadastrarTextField: UITextField!
    
    
    
    var auth:Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        
    }
    
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        }
    
    @IBAction func btCadastrar(_ sender: UIButton) {
        let email:String = self.emailcadastrarTextField.text ?? ""
        let senha:String = self.senhacadastrarTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: senha, completion: { (result, error) in
            
            if error != nil{
                self.alert(title: "Atenção", message: "falha ao cadastrar")
                print("falha ao cadastrar")
                
            }else{
                self.alert(title: "Parabéns", message: "Sucesso ao Cadastrar!")
                print("Sucesso ao Cadastrar!")
            }
            
            
        })
    }
    
    
    @IBAction func btVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
