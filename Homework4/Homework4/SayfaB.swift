//
//  SayfaB.swift
//  Homework4
//
//  Created by Aleyna IŞIK on 18.09.2023.
//

import UIKit

class SayfaB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func buttonGitY(_ sender: Any) {
    performSegue(withIdentifier: "SayfaB_to_SayfaY", sender: nil)

  }
  
}
