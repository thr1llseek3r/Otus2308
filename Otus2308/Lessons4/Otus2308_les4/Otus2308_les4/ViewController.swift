//
//  ViewController.swift
//  Otus2308_les4
//
//  Created by Galagan Sergey on 15.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //basicAnimation()
        //keyAnimation()
        pathDraw()
    }
    
    private func basicAnimation() {
        let frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 50, height: 50))
        let newView = UIView(frame: frame)
        newView.backgroundColor = .black
        view.addSubview(newView)
        
        // animationCALayer
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.toValue = 200
        animation.duration = 3
//        animation.autoreverses = true
//        animation.repeatCount = .infinity
        
        // запуск анимации
        newView.layer.add(animation, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //MARK: важно, что фрейм несмотря на то что вьюха сдвинется не изменится, поскольку это просто слой его двигается
            print(newView.frame)
        }
    }
    private func keyAnimation() {
        let frame = CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 50, height: 50))
        let newView = UIView(frame: frame)
        newView.backgroundColor = .black
        view.addSubview(newView)
        
        // CAKeyframeAnimation - рисует по точкам
        let animation = CAKeyframeAnimation(keyPath: "position.y")
        animation.values = [200,300,100]
        animation.duration = 3
        newView.layer.add(animation, forKey: nil)
    }
    private func pathDraw() {
        //рисовалка, которая заполняется кривой безье, у нас так прогресс бар выполнен
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 3
        
        
        let path = UIBezierPath()
        path.move(to: view.center)
        path.addCurve(
         to: view.center,
         controlPoint1: CGPoint(x: view.center.x + 150, y: view.center.y + 150),
         controlPoint2: CGPoint(x: view.center.x - 150, y: view.center.y + 150)
        )
        path.lineWidth = 2
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.path = path.cgPath
        
        view.layer.addSublayer(shapeLayer)
    }
    
}

