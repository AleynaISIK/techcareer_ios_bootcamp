//
//  SayfaA.swift
//  Homework4
//
//  Created by Aleyna IŞIK on 18.09.2023.
//

import UIKit

class SayfaA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func buttonGitB(_ sender: Any) {
    performSegue(withIdentifier: "SayfaA_to_SayfaB", sender: nil)

  }
  
}
