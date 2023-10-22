//
//  DetayViewModel.swift
//  SiparisNoktasiUygulamasi
//
//  Created by Aleyna IŞIK on 09.10.2023.
//

import Foundation
import RxSwift
import UIKit

class DetayViewModel{
  
  var krepo             = YemeklerDaoRepository()
  var siparisMiktari   = BehaviorSubject<Int>(value: 1)
  var toplamUcret      = BehaviorSubject<Int>(value: 1)
  var yemekDetayListe  = BehaviorSubject<[YemekDetay]>(value: [YemekDetay]())
  
  init(){
    siparisMiktari  = krepo.siparisMiktari
    toplamUcret     = krepo.toplamUcret
    yemekDetayListe = krepo.yemekDetayListe
  }
  
  func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String ){
    krepo.sepeteEkle(yemek_adi: yemek_adi,
                     yemek_resim_adi: yemek_resim_adi,
                     yemek_fiyat: yemek_fiyat,
                     yemek_siparis_adet: yemek_siparis_adet,
                     kullanici_adi: kullanici_adi)
  }
  
  
  //MARK: detaydaki adet miktarını ayarlama
  func adetHesapla(sender: UIButton){
    krepo.adetHesapla(sender: sender)
  }
  
  func toplamUcretiHesapla(ucret: Int){
    krepo.toplamUcretiHesapla(ucret: ucret)
  }
  
  func sepetiGuncelle(kullanici_adi: String){
    krepo.sepetGuncelle(kullanici_adi: kullanici_adi )
  }
  
  func sepettenSil(sepet_yemek_id:Int, kullanici_adi:String){
    krepo.sepettenSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: "Aleyna")
  }
  
  func sepeteKontrolluEkleme(yemekDetay : [YemekDetay], yemek: Yemekler?, viewModel: DetayViewModel){
    
    var kAdi = false
    var y = YemekDetay()
    for i in yemekDetay{
      if let yemekAdi = i.yemek_adi{
        if yemekAdi == yemek!.yemek_adi{
          kAdi = true
          y = i
          break
        } else {
          kAdi = false
        }
      }
    }
    
    if kAdi {
      viewModel.sepettenSil(sepet_yemek_id: Int(y.sepet_yemek_id!)! , kullanici_adi: "Aleyna")
      if let yemek = yemek{
        let Miktar = (try? viewModel.siparisMiktari.value()) ?? 1
        viewModel.sepeteEkle(yemek_adi: yemek.yemek_adi ?? "yemek bulunamadı",
                             yemek_resim_adi: yemek.yemek_resim_adi! ,
                             yemek_fiyat: (Int((yemek.yemek_fiyat)!)! * (Miktar + Int(y.yemek_siparis_adet!)!)) ,
                             yemek_siparis_adet: Miktar + Int(y.yemek_siparis_adet!)!,
                             kullanici_adi: "Aleyna")
      }
    } else {
      if let yemek = yemek{
        let Miktar = (try? viewModel.siparisMiktari.value()) ?? 1
        viewModel.sepeteEkle(yemek_adi: yemek.yemek_adi ?? "yemek bulunamadı",
                             yemek_resim_adi: yemek.yemek_resim_adi! ,
                             yemek_fiyat: (Int((yemek.yemek_fiyat)!)! * Miktar) ,
                             yemek_siparis_adet: Miktar,
                             kullanici_adi: "Aleyna")
      }
    }
  }
  
  
}
