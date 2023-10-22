//
//  SepetViewModel.swift
//  SiparisNoktasiUygulamasi
//
//  Created by Aleyna IŞIK on 10.10.2023.
//

import Foundation
import RxSwift
import UIKit

class SepetViewModel{
  
  var krepo            = YemeklerDaoRepository()
  var yemekDetayListe  = BehaviorSubject<[YemekDetay]>(value: [YemekDetay]())
  var siparisMiktari   = BehaviorSubject<Int>(value: 1)
  var toplamUcret      = BehaviorSubject<Int>(value: 1)
  
  var veri = 0
  
  init(){
      yemekDetayListe   = krepo.yemekDetayListe
      siparisMiktari    = krepo.siparisMiktari
      toplamUcret       = krepo.toplamUcret
  }
  
  func sepetGuncelle(kullanici_adi: String){
      krepo.sepetGuncelle(kullanici_adi: kullanici_adi)
  }
  
  func sepettenSil(sepet_yemek_id:Int, kullanici_adi: String){
      krepo.sepettenSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
  }
  
  
  func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String ){
      krepo.sepeteEkle(yemek_adi        : yemek_adi,
                     yemek_resim_adi  : yemek_resim_adi,
                     yemek_fiyat      : yemek_fiyat,
                     yemek_siparis_adet: yemek_siparis_adet,
                     kullanici_adi     : kullanici_adi)
  }
  
  func badge(yemekDetay: [YemekDetay], tabBarItem: UITabBarItem){
      veri = yemekDetay.count
      tabBarItem.badgeValue = veri > 0 ? "\(veri)" : nil
  }
  
  func toplamUcret(yemekDetay: [YemekDetay]) -> Int{
      var toplamUcret = 0
      for i in yemekDetay{
          toplamUcret += Int(i.yemek_fiyat!)!
      }
      return toplamUcret
  }
  
}


