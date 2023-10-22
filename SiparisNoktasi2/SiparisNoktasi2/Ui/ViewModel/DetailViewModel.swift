//
//  DetailViewModel.swift
//  SiparisNoktasi2
//
//  Created by Aleyna IŞIK on 19.10.2023.
//

import Foundation
import RxSwift

class DetailViewModel {
  
  var krepo = YemeklerDaoRepository()
  var yemekDetay = BehaviorSubject<[YemekDetay]>(value: [YemekDetay]())
    
  
  func sepeteYemekEkle(yemek: Yemekler, adet: Int, username: String){
    krepo.sepeteYemekEkle(yemek: yemek, adet: adet, username: username)
  }
  

}
