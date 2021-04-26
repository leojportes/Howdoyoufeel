//
//  ViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btFrase(_ sender: Any) {
        var frases: [String] = []
        frases.append("frase 1")
        frases.append("frase 2")
        frases.append("frase 3")
        frases.append("frase 4")
        frases.append("frase 5")
        frases.append("frase 6")
        frases.append("frase 7")
        frases.append("frase 8")
        frases.append("frase 9")
        

        var fraseAleatoria = arc4random_uniform(9)
        fraseTextField.text = frases[ Int(fraseAleatoria) ]
        
    }

    @IBOutlet weak var fraseTextField: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

