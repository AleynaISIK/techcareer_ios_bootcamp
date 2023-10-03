//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Aleyna IŞIK on 26.09.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository{ //Dao: Database Access Object
  
  var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
  
  func kaydet(kisi_ad : String, kisi_tel: String){
    print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)")
    
  }
  
  func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
    print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    
  }
  
  func ara(aramaKelimesi : String){
    print("Kişi ara : \(aramaKelimesi)")
  }
  
  func sil(kisi_id : Int){
    print("Kişi sil : \(kisi_id)")
  }
  
  func kisileriYukle(){
    var liste = [Kisiler]()
    let k1 = Kisiler(kisi_id: 1, kisi_ad: "Aleyna", kisi_tel: "23456")
    let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ali", kisi_tel: "1456")
    let k3 = Kisiler(kisi_id: 3, kisi_ad: "Kasım", kisi_tel: "33444")
    liste.append(k1) //0.
    liste.append(k2) //1.
    liste.append(k3) //2.
    kisilerListesi.onNext(liste)
  }
}
