//
//  ViewController.swift
//  Homework4
//
//  Created by Aleyna IŞIK on 18.09.2023.
//

import UIKit

class Anasayfa: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func buttonGitA(_ sender: Any) {
    performSegue(withIdentifier: "Anasayfa_to_SayfaA", sender: nil)
  }
  
  @IBAction func buttonGitX(_ sender: Any) {
    performSegue(withIdentifier: "Anasayfa_to_SayfaX", sender: nil)
  }
}

