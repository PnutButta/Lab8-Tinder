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
        let location = sender.location(in: cardImage)
        let velocity = sender.velocity(in: cardImage)
        let translation = sender.translation(in: cardImage)
        
        if sender.state == .began {
            print("Gesture began")
        } else if sender.state == .changed {
            print("Gesture is changing")
        } else if sender.state == .ended {
            print("Gesture ended")
        }
    
        // For positive horizontal translation
        if (velocity.x > 10) {
            cardImage.transform = cardImage.transform.rotated(by: CGFloat(15 * M_PI / 180))
            if sender.state == .ended {
               cardImage.transform = CGAffineTransform.identity
            }
            
        } else {
            // For negative horizontal translations
            cardImage.transform = cardImage.transform.rotated(by: CGFloat(-15 * M_PI / 180))
            if sender.state == .ended {
                cardImage.transform = CGAffineTransform.identity
            }
        }
        
        if (translation.x > 50) {
            
        } else {
            
        }
    }
    
    /*
    UIView.animate(withDuration:0.4, animations: {
        // This causes first view to fade in and second view to fade out
        self.firstView.alpha = 1
        self.secondView.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
