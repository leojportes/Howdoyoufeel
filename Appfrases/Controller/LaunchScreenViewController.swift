//
//  LaunchScreenViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 28/04/21.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraBackGround()

        // Do any additional setup after loading the view.
    }
    
    public func configuraBackGround() {
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = view.bounds
        gradientlayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor(red: 106/255, green: 213/255, blue: 141/255, alpha: 100).cgColor]
        gradientlayer.shouldRasterize = true
        bgView.layer.addSublayer(gradientlayer)
        gradientlayer.startPoint = CGPoint(x: 0.4, y: 0.4) // lado esquerdo
        gradientlayer.endPoint =  CGPoint(x: 0.5, y: -0.5)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
