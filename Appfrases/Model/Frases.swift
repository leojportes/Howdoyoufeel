//
//  Frases.swift
//  Appfrases
//
//  Created by Leonardo Oliveira Portes on 27/04/21.


import Foundation

public func configuraBackGround() {
    let gradientlayer = CAGradientLayer()
    gradientlayer.frame = view.bounds
    gradientlayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor(red: 106/255, green: 213/255, blue: 141/255, alpha: 100).cgColor]
    gradientlayer.shouldRasterize = true
    backgroundImage.layer.addSublayer(gradientlayer)
    gradientlayer.startPoint = CGPoint(x: 0.4, y: 0.4) // lado esquerdo
    gradientlayer.endPoint =  CGPoint(x: 0.5, y: -0.5)
}
