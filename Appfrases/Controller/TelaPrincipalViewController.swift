//
//  TelaPrincipalViewController.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 27/04/21.
//

import UIKit

class TelaPrincipalViewController: UIViewController {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewFelicidades.dataSource = self
        pickerViewFelicidades.delegate = self
        entradaFelicidade.inputView = pickerViewFelicidades
        configuraBackGround()
    }
    
    
    // MARK: Variables
    
    let sentimento = ["Escolha um sentimento","Estou feliz", "Estou triste", "Estou cansado", "Estou ansioso", "Estou exausto", "Estou estressado", "Estou doente", "Estou empolgado", "Estou Alegre", "Estou nervoso"]
    
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
        let autenticaPermicao = UIAlertController(title: "Alerta!", message: "Deseja ser redirecionado para o site do Spotify Web?", preferredStyle: UIAlertController.Style.alert)
        autenticaPermicao.addAction(UIAlertAction(title: "Acessar", style: .default, handler: { action in
            self.playlistSpotify()
            print("Acessou o Site")
        }))

      autenticaPermicao.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Cancelado")
      }))

      present(autenticaPermicao, animated: true, completion: nil)
        
       
    }
    
    

    
    @IBAction func btAjuda(_ sender: UIButton) {
        
        let autenticaPermicao = UIAlertController(title: "Alerta!", message: "Deseja ser redirecionado para o site?", preferredStyle: UIAlertController.Style.alert)
        autenticaPermicao.addAction(UIAlertAction(title: "Acessar", style: .default, handler: { action in
            UIApplication.shared.open(URL(string: "https://www.cvv.org.br")! as URL, options: [:], completionHandler: nil)
            print("Acessou o Site")
        }))

      autenticaPermicao.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Cancelado")
      }))

      present(autenticaPermicao, animated: true, completion: nil)
    }
 
    
    
    // MARK: Functions
    
    public func configuraBackGround() {
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = view.bounds
        gradientlayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor(red: 106/255, green: 213/255, blue: 141/255, alpha: 100).cgColor]
        gradientlayer.shouldRasterize = true
        backgroundImage.layer.addSublayer(gradientlayer)
        gradientlayer.startPoint = CGPoint(x: 0.4, y: 0.4) // lado esquerdo
        gradientlayer.endPoint =  CGPoint(x: 0.5, y: -0.5)
    }
    
    public func playlistSpotify() {

        if entradaFelicidade.text == sentimento[1] {
            UIApplication.shared.open(URL(string: "https://open.spotify.com/playlist/37i9dQZF1DWUIDYTCle9M9?si=13355c935d114102")! as URL, options: [:], completionHandler: nil)
            
        }else if entradaFelicidade.text == sentimento[2] {
            UIApplication.shared.open(URL(string: "https://open.spotify.com/playlist/37i9dQZF1DWYBO1MoTDhZI?si=3e25637f9b2f41cd")! as URL, options: [:], completionHandler: nil)
            
        }else if entradaFelicidade.text == sentimento[3] {
            UIApplication.shared.open(URL(string: "https://open.spotify.com/playlist/37i9dQZF1DX6aTaZa0K6VA?si=f9354309ad9643a5")! as URL, options: [:], completionHandler: nil)
             
        }else if entradaFelicidade.text == sentimento[4] {
            UIApplication.shared.open(URL(string: "https://open.spotify.com/playlist/6nVlroxRmcs6h03Jl18nfR?si=bef5d0f66db64223")! as URL, options: [:], completionHandler: nil)
                }
}
     
    func validaFelicidade() {
        
        let escolhaSentimento: [String] = ["Escolha um Sentimento"]
        
        let frasesFeliz: [String] = ["frase feliz 1","frase feliz 2","frase feliz 3","frase feliz 4"]
       
        let frasesTriste: [String] = ["frase triste 1", "frase triste 2", "frase triste 3", "frase triste 4"]
        
        let frasesCansado: [String] = ["O sucesso nasce do querer, da determina????o e persist??ncia em se chegar a um objetivo. Mesmo n??o atingindo o alvo, quem busca e vence obst??culos, no m??nimo far?? coisas admir??veis\n ??? Jos?? de Alencar", "Se voc?? quer ser bem-sucedido precisa de dedica????o total, buscar seu ??ltimo limite e dar o melhor de si mesmo.\n ??? Ayrton Senna", "N??o crie limites para si mesmo. Voc?? deve ir t??o longe quanto sua mente permitir. O que voc?? mais quer pode ser conquistado\n ??? Mary Kay Ash"]
       
        let frasesAnsioso: [String] = ["Seja mais paciente, mas n??o deixe que esse estado de esp??rito te fa??a desistir das coisas. ", "Uma das pr??ticas mais ben??ficas para um ansioso ?? a medita????o. Sente-se, conecte-se consigo mesmo e controle sua respira????o. Voc?? ver?? o bem que esse ritual t??o simples far?? para sua mente.", "Espante a ansiedade de sua vida. Traga para o presente apenas os momentos de felicidade, apenas aquilo que te far?? uma pessoa melhor.", "Nem todos os dias da sua vida precisam ser t??o produtivos. Coloque sua sa??de mental em primeiro lugar e n??o se force al??m do que seus limites permitem com tanta frequ??ncia.", "Ansiedade ?? exatamente isso: nada aconteceu, e no seu pensamento est?? tudo perdido e desmoronado.", "A ansiedade envenena o corpo e o esp??rito. Respire fundo, mantenha a calma e seja positivo. As coisas v??o dar certo.", "A ansiedade tenta nos consumir todos os dias, at?? que um dia decidimos resistir e deixar o tempo nos levar.", "Voc?? nunca ser?? perfeito, pare de ficar se comparando com as outras pessoas, elas tamb??m n??o s??o perfeitas.", "Respire devagar e tente manter a calma. ?? importante que voc?? prenda a respira????o quando se sentir ansioso. Respire bem fundo e solte devagar por v??rias vezes. ", "Voc?? n??o pode controlar tudo o que acontece no mundo, liberte-se dos pensamentos negativos e siga em busca dos seus sonhos.", "Voc?? pode superar todos os seus problemas, basta ter calma e refletir sobre a solu????o. Tudo pode ser resolvido, tenha paci??ncia. "]
        
        let frasesExausto: [String] = ["1","2","3"]
        
        let frasesEstressado: [String] = ["1","2","3"]
        
        let frasesDoente: [String] = ["1","2","3"]
        
        let frasesEmpolgado: [String] = ["1","2","3"]
        
        let frasesAlegre: [String] = ["1","2","3"]
        
        let frasesNervoso: [String] = ["1","2","3"]
        
   
        if entradaFelicidade.text == sentimento[0] {
            resultadoFrase.text = escolhaSentimento[0]
            
        }else if entradaFelicidade.text == sentimento[1] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesFeliz.count))
            resultadoFrase.text = frasesFeliz[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "feliz")
            
        }else if entradaFelicidade.text == sentimento[2] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesTriste.count))
            resultadoFrase.text = frasesTriste[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "triste")
            
        }else if entradaFelicidade.text == sentimento[3] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesCansado.count))
            resultadoFrase.text = frasesCansado[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "cansado")
            
        }else if entradaFelicidade.text == sentimento[4] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesAnsioso.count))
            resultadoFrase.text = frasesAnsioso[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "ansioso")
        
        }else if entradaFelicidade.text == sentimento[5] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesExausto.count))
            resultadoFrase.text = frasesExausto[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "exausto")
        
        }else if entradaFelicidade.text == sentimento[6] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesEstressado.count))
            resultadoFrase.text = frasesEstressado[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "estressado")
    
        }else if entradaFelicidade.text == sentimento[7] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesDoente.count))
            resultadoFrase.text = frasesDoente[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "doente")
            
        }else if entradaFelicidade.text == sentimento[8] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesEmpolgado.count))
            resultadoFrase.text = frasesEmpolgado[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "Empolgado")
            
        }else if entradaFelicidade.text == sentimento[9] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesAlegre.count))
            resultadoFrase.text = frasesAlegre[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "Alegre")
            
        }else if entradaFelicidade.text == sentimento[10] {
            let fraseAleatoria = arc4random_uniform(UInt32(frasesNervoso.count))
            resultadoFrase.text = frasesNervoso[ Int(fraseAleatoria)]
            imageSpotify.image = UIImage(named: "Nervoso")
            
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
    

    

