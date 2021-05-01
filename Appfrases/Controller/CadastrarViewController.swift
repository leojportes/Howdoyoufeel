//
//  LoginViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 29/04/21.
//

import UIKit
import Firebase


class CadastrarViewController: UIViewController {
    
    // MARK: Variables
    
    
    var auth:Auth?
    let imageicon = UIImageView()
    var iconClick = false
    
    
    // MARK: Outlets
    
    @IBOutlet weak var emailcadastrarTextField: UITextField!
    @IBOutlet weak var senhacadastrarTextField: UITextField!
    
    
    
    // MARK: Actions
    
    @IBAction func btVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btCadastrar(_ sender: UIButton) {
        let email:String = self.emailcadastrarTextField.text ?? ""
        let senha:String = self.senhacadastrarTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: senha, completion: { (result, error) in
            
            if error != nil{
                self.alert(title: "Atenção", message: "falha ao cadastrar")
                print("Email já cadastrado!")
                
            }else{
                self.alert(title: "Parabéns!", message: "Email e senha cadastrados.")
                print("Sucesso ao Cadastrar!")
            }
        })
    }
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        imageicon.image = UIImage(named: "eye_closed")
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named:  "eye_closed.png")!.size.width, height: UIImage(named: "eye_closed.png")!.size.height)
        imageicon.frame = CGRect(x: -10, y: 0, width: UIImage(named:  "eye_closed.png")!.size.width, height: UIImage(named: "eye_closed.png")!.size.height)
        senhacadastrarTextField.rightView = contentView
        senhacadastrarTextField.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    // MARK: Functions
    
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick{
            iconClick=false
            tappedImage.image = UIImage(named: "eye_open.png")
            senhacadastrarTextField.isSecureTextEntry = false
        }else{
            iconClick=true
            tappedImage.image = UIImage(named: "eye_closed.png")
            senhacadastrarTextField.isSecureTextEntry = true
            }
    }
        
    
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        }
}
