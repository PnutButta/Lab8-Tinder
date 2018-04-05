//
//  CardsViewController.swift
//  Tinder
//
//  Created by Angel Chara'e Mitchell on 3/25/18.
//  Copyright © 2018 Angel Chara'e Mitchell. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImage.isUserInteractionEnabled = true
        cardImage.image = #imageLiteral(resourceName: "ryan")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: cardImage)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = cardImage.center
            
        } else if sender.state == .changed {
            print("Gesture is changing")
            // using translation direction to rotate & translate
            cardImage.transform = CGAffineTransform(rotationAngle: (CGFloat.pi / 8) * (translation.x * 0.01))
            cardImage.center.x = cardInitialCenter.x + translation.x
            cardImage.center.y = cardInitialCenter.y + translation.y
            
        } else if sender.state == .ended {
            print("Gesture ended")
            self.cardImage.alpha = 0
            
            if (translation.x < 50) {
                print("Swiped Left")
                UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveEaseInOut,
                               animations: { self.cardImage.alpha = 1 },
                               completion: { (Bool) in
                                self.cardImage.removeFromSuperview()
                })
                
            } else if (translation.x > 50) {
                print("Swiped Right")
                UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveEaseInOut,
                               animations: { self.cardImage.alpha = 1 },
                               completion: { (Bool) in
                                self.cardImage.removeFromSuperview()
                })
                
            } else {
                cardImage.transform = CGAffineTransform.identity
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as! ProfileViewController
        destinationView.newImage = cardImage.image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
