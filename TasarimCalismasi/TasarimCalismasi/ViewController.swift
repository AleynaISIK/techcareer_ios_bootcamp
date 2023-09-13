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
    
//    gezinme çubuğunun standart (normal) görünümünü yapılandırır. Standart görünüm, gezinme çubuğunun varsayılan durumunu temsil eder.
    navigationController?.navigationBar.standardAppearance = appereance
//    gezinme çubuğunun kompakt (dar) görünümünü yapılandırır. Kompakt görünüm, ekran boyutu veya diğer faktörler nedeniyle gezinme çubuğunun daha sınırlı bir alanı olduğu durumlar için kullanılır.
    navigationController?.navigationBar.compactAppearance = appereance
//    gezinme çubuğunun kaydırma kenarı görünümünü yapılandırır. Bu görünüm, özellikle ekranın üstünden aşağı kaydırıldığında gezinme çubuğunun nasıl görüneceğini belirler.
    navigationController?.navigationBar.scrollEdgeAppearance = appereance
    
  }
  
}

