//
//  LoginViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 29/04/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    // MARK: Variables
    
    let button = UIButton(type: .custom)
    var auth:Auth?
    let imageicon = UIImageView()
    var iconClick = false
    
    
    // MARK: LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
     
        imageicon.image = UIImage(named: "eye_closed")
        
        let contentView = UIView()
        contentView.addSubview(imageicon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named:  "eye_closed.png")!.size.width, height: UIImage(named: "eye_closed.png")!.size.height)
        imageicon.frame = CGRect(x: -10, y: 0, width: UIImage(named:  "eye_closed.png")!.size.width, height: UIImage(named: "eye_closed.png")!.size.height)
        senhaTextField.rightView = contentView
        senhaTextField.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick{
            iconClick=false
            tappedImage.image = UIImage(named: "eye_open.png")
            senhaTextField.isSecureTextEntry = false
        }else{
            iconClick=true
            tappedImage.image = UIImage(named: "eye_closed.png")
            senhaTextField.isSecureTextEntry = true
            }
    }
    
    // MARK: Outlets
    
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: Actions
    
    @IBAction func btEntrar(_ sender: UIButton) {
        let email:String = self.emailTextField.text ?? ""
        let senha:String = self.senhaTextField.text ?? ""
        
        
        self.auth?.signIn(withEmail: email, password: senha, completion: { (usuario, error) in
            if error != nil{
                self.alert(title: "Ops! Algo deu errado.", message: "Dados incorretos, tente novamente!")
//                print("Dados incorretos, tente novamente!")
            }else{
                self.performSegue(withIdentifier: "telaPrincipal", sender: nil)
//                self.alert(title: "Parabéns", message: "Login realizado com Sucesso!")
            }
        })
    }
    
    @IBAction func btRedefinirSenha(_ sender: Any) {
        self.performSegue(withIdentifier: "redefinirSenhaSegue", sender: nil)
    }
    
    
 
    // MARK: Functions
    
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        }
    

    
   
    
    
}


