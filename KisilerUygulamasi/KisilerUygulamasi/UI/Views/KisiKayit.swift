//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by Aleyna IŞIK on 21.09.2023.
//

import UIKit

class KisiKayit: UIViewController {
  
  @IBOutlet weak var tfKisiAd: UITextField!
  
  @IBOutlet weak var tfKisiTel: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
  @IBAction func buttonKaydet(_ sender: Any) {
    
    if let ad = tfKisiAd.text, let tel = tfKisiTel.text{
      kaydet(kisi_ad: ad, kisi_tel: tel)
    }
  }
  
  func kaydet(kisi_ad : String, kisi_tel: String){
    
    print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)")
    
  }
  
}
