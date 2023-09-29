//
//  ViewController.swift
//  UserDefaultsKullanimi
//
//  Created by Aleyna IŞIK on 28.09.2023.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var labelSayac: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let ud = UserDefaults.standard
    
    //    Kayıt
    ud.set("Ahmet", forKey: "ad")
    ud.set(1.78, forKey: "boy")
    
    //    Okuma
    let gelenAd = ud.string(forKey: "ad") ?? "isim yok"
    let gelenBoy = ud.double(forKey: "boy") //0.0
    print( "Gelen Ad  : \(gelenAd)")
    print( "Gelen Boy : \(gelenBoy)")
    
    
    //Silme
    //    ud.removeObject(forKey: "ad")
    
    
    //Sayaç Uygulama
    var sayac = ud.integer(forKey: "sayac") //varsayılan = 0
    sayac += 1
    
    ud.set(sayac, forKey: "sayac")
    labelSayac.text = "Açılış Sayısı : \(sayac)"
  }
  
  
}

