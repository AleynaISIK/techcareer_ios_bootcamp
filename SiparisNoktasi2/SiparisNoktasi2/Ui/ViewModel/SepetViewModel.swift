//
//  SepetViewModel.swift
//  SiparisNoktasi2
//
//  Created by Aleyna IŞIK on 19.10.2023.
//

import Foundation
import RxSwift

class SepetViewModel {
  
  var krepo = YemeklerDaoRepository()
  var yemekDetay = BehaviorSubject<[YemekDetay]>(value: [YemekDetay]())
    
  
  func sepetiGetir(sepet_yemek_id: Int,kullanici_adi: String) {
    krepo.sepetiGetir(username: kullanici_adi) {
        print("Sepet getirildi.")
    }

  }
  
  func sil(sepet_yemek_id: Int, kullanici_adi: String) {
    krepo.sil(yemek_id: sepet_yemek_id)
  }
  
  

}
