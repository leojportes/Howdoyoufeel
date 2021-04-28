//
//  TelaPrincipalViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 27/04/21.
//

import UIKit

class TelaPrincipalViewController: UIViewController {
    
    // MARK: Ciclo de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewFelicidades.dataSource = self
        pickerViewFelicidades.delegate = self
        entradaFelicidade.inputView = pickerViewFelicidades
        
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = view.bounds
        gradientlayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor(red: 106/255, green: 213/255, blue: 141/255, alpha: 100).cgColor]
        gradientlayer.shouldRasterize = true
        backgroundImage.layer.addSublayer(gradientlayer)
        gradientlayer.startPoint = CGPoint(x: 0.4, y: 0.4) // lado esquerdo
        gradientlayer.endPoint =  CGPoint(x: 0.5, y: -0.5)
        
    }
    // MARK: Variáveis
    
    let sentimento = ["Escolha um sentimento","Feliz", "Triste", "Cansado", "Ansioso"]
    
    // MARK: Outlets

    @IBOutlet weak var entradaFelicidade: UITextField!
    
    @IBOutlet weak var resultadoFrase: UILabel!
    
    @IBOutlet weak var pickerViewFelicidades: UIPickerView!
    
    @IBOutlet weak var imageSpotify: UIImageView!
    
    @IBOutlet weak var backgroundImage: UIView!
    
        // MARK: Actions
    
    @IBAction func btHelpMe(_ sender: UIButton) {
        validaFelicidade()
    }
    
    @IBAction func btSpotify(_ sender: UIButton) {
        playlistSpotify()
    }
    
    
    // MARK: Métodos
    
   
    
public func playlistSpotify() {
    let listaSpotify: [String] = ["", "https://open.spotify.com/playlist/37i9dQZF1DWYBO1MoTDhZI?si=3e25637f9b2f41cd"]
    
    if entradaFelicidade.text == sentimento[1] {
        UIApplication.shared.open(URL(string: listaSpotify[1])! as URL, options: [:], completionHandler: nil)
        
    }else if entradaFelicidade.text == sentimento[2] {
        UIApplication.shared.open(URL(string: "https://open.spotify.com/playlist/37i9dQZF1DWUIDYTCle9M9?si=13355c935d114102")! as URL, options: [:], completionHandler: nil)
        
    }else if entradaFelicidade.text == sentimento[3] {
        UIApplication.shared.open(URL(string: "https://open.spotify.com/playlist/37i9dQZF1DX6aTaZa0K6VA?si=f9354309ad9643a5")! as URL, options: [:], completionHandler: nil)
         
    }else if entradaFelicidade.text == sentimento[4] {
        UIApplication.shared.open(URL(string: "https://open.spotify.com/playlist/6nVlroxRmcs6h03Jl18nfR?si=bef5d0f66db64223")! as URL, options: [:], completionHandler: nil)
            }
}
     
    func validaFelicidade() {
        var escolhaSentimento: [String] = ["Escolha um Sentimento"]
        var frasesFeliz: [String] = []
        frasesFeliz.append("frase feliz 1")
        frasesFeliz.append("frase feliz 2")
        frasesFeliz.append("frase feliz 3")
        frasesFeliz.append("Frase feliz 4")
        
        var frasesTriste: [String] = []
        frasesTriste.append("frase triste 1")
        frasesTriste.append("frase triste 2")
        frasesTriste.append("frase triste 3")
        frasesTriste.append("Frase triste 4")
          
        let frasesCansado: [String] = ["O sucesso nasce do querer, da determinação e persistência em se chegar a um objetivo. Mesmo não atingindo o alvo, quem busca e vence obstáculos, no mínimo fará coisas admiráveis\n – José de Alencar", "Se você quer ser bem-sucedido precisa de dedicação total, buscar seu último limite e dar o melhor de si mesmo.\n – Ayrton Senna", "Não crie limites para si mesmo. Você deve ir tão longe quanto sua mente permitir. O que você mais quer pode ser conquistado\n – Mary Kay Ash"]
      
        
        var frasesAnsioso: [String] = ["Seja mais paciente, mas não deixe que esse estado de espírito te faça desistir das coisas. ", "Uma das práticas mais benéficas para um ansioso é a meditação. Sente-se, conecte-se consigo mesmo e controle sua respiração. Você verá o bem que esse ritual tão simples fará para sua mente.", "Espante a ansiedade de sua vida. Traga para o presente apenas os momentos de felicidade, apenas aquilo que te fará uma pessoa melhor.", "Nem todos os dias da sua vida precisam ser tão produtivos. Coloque sua saúde mental em primeiro lugar e não se force além do que seus limites permitem com tanta frequência.", "Ansiedade é exatamente isso: nada aconteceu, e no seu pensamento está tudo perdido e desmoronado.", "A ansiedade envenena o corpo e o espírito. Respire fundo, mantenha a calma e seja positivo. As coisas vão dar certo.", "A ansiedade tenta nos consumir todos os dias, até que um dia decidimos resistir e deixar o tempo nos levar."]
        
        frasesAnsioso.append("Você nunca será perfeito, pare de ficar se comparando com as outras pessoas, elas também não são perfeitas.")
        frasesAnsioso.append("Respire devagar e tente manter a calma. É importante que você prenda a respiração quando se sentir ansioso. Respire bem fundo e solte devagar por várias vezes. ")
        frasesAnsioso.append("Você não pode controlar tudo o que acontece no mundo, liberte-se dos pensamentos negativos e siga em busca dos seus sonhos.")
        frasesAnsioso.append("Você pode superar todos os seus problemas, basta ter calma e refletir sobre a solução. Tudo pode ser resolvido, tenha paciência. ")
        
        if entradaFelicidade.text == sentimento[0] {
            resultadoFrase.text = escolhaSentimento[0]
            imageSpotify.image = UIImage(named: "")
            
        }else if entradaFelicidade.text == sentimento[1] {
            let fraseAleatoria = arc4random_uniform(4)
            resultadoFrase.text = frasesFeliz[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "feliz")
            
        }else if entradaFelicidade.text == sentimento[2] {
            let fraseAleatoria = arc4random_uniform(4)
            resultadoFrase.text = frasesTriste[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "triste")
            
        }else if entradaFelicidade.text == sentimento[3] {
            let fraseAleatoria = arc4random_uniform(3)
            resultadoFrase.text = frasesCansado[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "cansado")
            
        }else if entradaFelicidade.text == sentimento[4] {
            let fraseAleatoria = arc4random_uniform(11)
            resultadoFrase.text = frasesAnsioso[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "ansioso")
            }
        }
    }
    
    // MARK: Extensions

extension TelaPrincipalViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sentimento.count
    }
}

extension TelaPrincipalViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return sentimento[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        entradaFelicidade.text = sentimento[row]
        entradaFelicidade.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: sentimento[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
}
    

    

