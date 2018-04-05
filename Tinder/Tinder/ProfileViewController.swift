//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Angel Chara'e Mitchell on 4/3/18.
//  Copyright © 2018 Angel Chara'e Mitchell. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePic.image = newImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backtoHome(_ sender: UITapGestureRecognizer) {
        let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "cardsView") as? UIViewController
        self.present(homeVc!, animated: true, completion: nil)
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
