//
//  ViewController.swift
//  Homework3
//
//  Created by Aleyna IŞIK on 16.09.2023.
//

import UIKit

class ViewController: UIViewController {
  
  var value = 0
  var minValue = 0
  
  @IBOutlet weak var number_label_outlet: UILabel!
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.title = NSLocalizedString("Bitki Detayı", comment: "")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Plant Detail"
    
    let appereance = UINavigationBarAppearance()
    appereance.backgroundColor = UIColor(named: "anaRenk")
    appereance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk2")! , .font: UIFont(name: "Flora", size: 38)! ]
    navigationController?.navigationBar.barStyle = .black
    
    navigationController?.navigationBar.standardAppearance = appereance
    navigationController?.navigationBar.compactAppearance = appereance
    navigationController?.navigationBar.scrollEdgeAppearance = appereance
    
    
    
  }
  
  @IBAction func plus_button_action(_ sender: Any) {
    value += 1
    updateLabel()
  }
  
  @IBAction func minus_button_action(_ sender: Any) {
    if value > minValue {
      value -= 1
      updateLabel()
    }
  }
  
  @IBAction func add_to_cart_button_action(_ sender: Any) {
    print("Sepete ekle butonuna tıklandı")
  }
  
  @IBAction func buy_now_button_action(_ sender: Any) {
    print("Satın alma butonuna tıklandı")
  }
  
  func updateLabel() {
    number_label_outlet.text = String(value)
  }
  
}

