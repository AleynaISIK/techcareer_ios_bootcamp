//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by Aleyna IŞIK on 12.09.2023.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "Pizza"
    
    let appereance = UINavigationBarAppearance()
    appereance.backgroundColor = UIColor(named: "anaRenk")
    appereance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")! , .font: UIFont(name: "Pacifico-Regular", size: 22)! ]
    navigationController?.navigationBar.barStyle = .black //üstteki saat rengi beyaz yapma ayarı
    //Cmd+shift+a similatörde gece gündüz değiştirme
    
    navigationController?.navigationBar.standardAppearance = appereance
    navigationController?.navigationBar.compactAppearance = appereance
    navigationController?.navigationBar.scrollEdgeAppearance = appereance
    
  }
  
}

