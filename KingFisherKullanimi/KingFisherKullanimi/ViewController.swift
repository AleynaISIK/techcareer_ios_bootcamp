//
//  ViewController.swift
//  KingFisherKullanimi
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
  @IBOutlet weak var imageView: AnimatedImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resimGoster(resimAdi: "baklava.png")
    // Do any additional setup after loading the view.
  }
  @IBAction func buttonResim1(_ sender: Any) {
    resimGoster(resimAdi: "kofte.png")
  }
  
  @IBAction func buttonResim2(_ sender: Any) {
    resimGoster(resimAdi: "su.png")
  }
  
  func resimGoster(resimAdi:String){
    if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)"){
      DispatchQueue.main.async {
        self.imageView.kf.setImage(with: url)
      }
    }
    
  }
}

