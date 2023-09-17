//
//  SayfaY.swift
//  Homework4
//
//  Created by Aleyna IŞIK on 18.09.2023.
//

import UIKit

class SayfaY: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  @IBAction func buttonAnasayfayaDon(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
  }
  
}
