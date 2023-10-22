//
//  YemeklerDaoRepository.swift
//  SiparisNoktasi2
//
//  Created by Aleyna IŞIK on 18.10.2023.
//

import Foundation
import RxSwift
import Alamofire

class YemeklerDaoRepository {//Dao : Database Access Object
    var yemekListesi = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
  
//http://kasimadalan.pe.hu/kisiler/tum_kisiler.php
  
  var sepetYemekListesi = [YemekDetay]()


  
    func kaydet(yemek_adi:String,kisi_tel:String){
       
    }
    
    
    func ara(aramaKelimesi:String){
      AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
          if let data = response.data {
              do{
                  let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                 
                  if var liste = cevap.yemekler {
                      if aramaKelimesi == "" {
                        self.yemekListesi.onNext(liste)
                      }
                      else {
                          liste = liste.filter({veri -> Bool in
                              (veri.yemek_adi?.lowercased().contains(aramaKelimesi.lowercased()))!
                              
                          })
                        self.yemekListesi.onNext(liste)

                      }
                  }
              }catch{
                  print(error.localizedDescription)
              }
          }
      }
  }
    
    func sil(yemek_id:Int){
       
    }
    
    func yemekleriYukle(){
      AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
          if let data = response.data {
              do{
                  let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                  if let liste = cevap.yemekler {
                      self.yemekListesi.onNext(liste)
                  }
                  //let rawResponse = try JSONSerialization.jsonObject(with: data)
                  //print(rawResponse)
              }catch{
                  print(error.localizedDescription)
              }
          }
      }
  }
  
  func sepeteYemekEkle(yemek: Yemekler, adet: Int, username: String) {
      var aynıYemek: YemekDetay?
      
      sepetiGetir(username: username) {
          aynıYemek = self.yemekKontrol(yemek: yemek)
          
          if aynıYemek != nil {
              let oldCount = aynıYemek?.yemek_siparis_adet
              let addCount = adet
              aynıYemek?.yemek_siparis_adet = String(Int(oldCount!)! + addCount)
              
              self.yemekSil(foodId: (aynıYemek?.sepet_yemek_id)!, username: username) {
                  let newFood = Yemekler(yemek_id: nil, yemek_adi: aynıYemek?.yemek_adi, yemek_fiyat: aynıYemek?.yemek_fiyat, yemek_resim_adi: aynıYemek?.yemek_resim_adi)
                  
                  self.sepeteYemekEkleYeni(yemek: newFood, count: Int(aynıYemek!.yemek_siparis_adet!)!, username: (aynıYemek?.kullanici_adi!)!)
              }
          }else{
              self.sepeteYemekEkleYeni(yemek: yemek, count: adet, username: username)
          }
      }
      
  }
  
  func sepeteYemekEkleYeni(yemek: Yemekler, count: Int, username: String) {
      let params: Parameters = ["yemek_adi": yemek.yemek_adi!, "yemek_resim_adi": yemek.yemek_resim_adi!, "yemek_fiyat": yemek.yemek_fiyat!, "yemek_siparis_adet": count, "kullanici_adi": username]
      
      //POST İLE SEPETE VERİ GÖNDERME
      AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
          if let data = response.data {
              do {
                print("veri geliyor")
                  let response = try JSONSerialization.jsonObject(with: data)
                  //print(response)
              }catch{
                  print(error.localizedDescription)
              }
          }
      }
  }
  
  
  func yemekSil(foodId: String, username: String, isFinished: @escaping () -> Void) {
      let params: Parameters = ["sepet_yemek_id": foodId, "kullanici_adi": username]
      AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { response in
          if let data = response.data {
              do{
                  let response = try JSONSerialization.jsonObject(with: data)
                  //print(response)
                  isFinished()
              }catch{
                  print(error.localizedDescription)
              }
          }
      }
  }
  
  func sepetiGetir(username: String, completion: @escaping () -> Void) {
      let params: Parameters = ["kullanici_adi": username]
      AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
          if let data = response.data {
              do {
                  let response = try JSONDecoder().decode(YemekDetayCevap.self, from: data)
                  //print(data)
                  if let list = response.sepet_yemekler {
                      DispatchQueue.main.async {
                          self.sepetYemekListesi = list
                          completion()
                      }
                  }
          }catch{
              print(error.localizedDescription)
              completion()
              }
          }
      }
  }
  
  
  func yemekKontrol(yemek: Yemekler) -> YemekDetay? {
      let benzerYemek = sepetYemekListesi.first {$0.yemek_adi == yemek.yemek_adi}
      if benzerYemek != nil {
          return benzerYemek!
      }
      return nil
  }
}
