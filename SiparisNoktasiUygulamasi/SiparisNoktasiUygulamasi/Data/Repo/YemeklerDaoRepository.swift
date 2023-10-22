//
//  YemeklerDaoRepository.swift
//  SiparisNoktasiUygulamasi
//
//  Created by Aleyna IŞIK on 05.10.2023.
//

import Foundation
import RxSwift
import Alamofire
import UIKit

class YemeklerDaoRepository{
  
  var yemekListesi     = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
  var yemekDetayListe  = BehaviorSubject<[YemekDetay]>(value: [YemekDetay]())
  var siparisMiktari   = BehaviorSubject<Int>(value: 1)
  var toplamUcret      = BehaviorSubject<Int>(value: 1)
  
  //MARK: anasayfa güncelleme verileri getirme
  func yemekleriYukle(){
    AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response{ response in
      if let data = response.data{
        do{
          let res = try JSONDecoder().decode(YemeklerCevap.self, from: data)
          if let list = res.yemekler{
            self.yemekListesi.onNext(list)
          }
        }catch{
          print("Anasayfa yüklemede hata var : \(error.localizedDescription)")
        }
      }
    }
  }
  
  //  MARK: Arama yapma
  func ara(aramaKelimesi: String) {
      AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { [weak self] response in
          if let data = response.data {
              do {
                  let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)

                  if let liste = cevap.yemekler {
                      if aramaKelimesi.isEmpty {
                          // Arama kelimesi boşsa tüm yemekleri göster
                          self?.yemekListesi.onNext(liste)
                      } else {
                          // Arama kelimesi dolu ise filtrele
                          let filtrelenmisListe = liste.filter { veri in
                              return (veri.yemek_adi?.lowercased().contains(aramaKelimesi.lowercased())) ?? false
                          }
                          
                          if filtrelenmisListe.isEmpty {
                              // Filtrelenmiş liste boşsa, yani aranan yiyecek bulunamadıysa
                              print("Aranan yiyecek bulunamadı")
                          } else {
                              self?.yemekListesi.onNext(filtrelenmisListe)
                          }
                      }
                  }
              } catch {
                  print("Arama yapmada hata var: \(error.localizedDescription)")
              }
          }
      }
  }

  
  //MARK: anasayfayı kategorilerilerine göre ayırma
  func kategori(yemekFiltrele: [String]) {
    AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
      if let data = response.data {
        do {
          let res = try JSONDecoder().decode(YemeklerCevap.self, from: data)
          if let list = res.yemekler {
            let filtrele = list.filter { yemek in
              return yemekFiltrele.contains(yemek.yemek_id!)
            }
            self.yemekListesi.onNext(filtrele)
          }
        } catch {
          print("Filtrelemede hata var: \(error.localizedDescription)")
        }
      }
    }
  }
  
  //MARK: sepet sayfasını güncelleme
  func sepetGuncelle(kullanici_adi: String){ // cvm
    let params: Parameters = ["kullanici_adi": kullanici_adi]
    AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response{ response in
      if let data = response.data{
        do{
          let res = try JSONDecoder().decode(YemekDetayCevap.self, from: data)
          if let list = res.sepet_yemekler{
            self.yemekDetayListe.onNext(list)
          }
        }catch{
          print("Sepet yüklemede hata var: \(error.localizedDescription)")
        }
      }
    }
  }
  
  //MARK: Sepete yemek ekle
  func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String  ){
    let params: Parameters = ["yemek_adi":yemek_adi, "yemek_resim_adi":yemek_resim_adi, "yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet, "kullanici_adi":kullanici_adi ]
    AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response{ reponse in
      if let data = reponse.data{
        do{
          let res = try JSONDecoder().decode(CRUDResponse.self, from: data)
          if res.success == 1{
            self.sepetGuncelle(kullanici_adi: kullanici_adi)
          }
        }catch{
          print("Sepet yemek eklemede hata var: \(error.localizedDescription)")
        }
      }
    }
  }
  
  //MARK: Sepetten yemek sil
  func sepettenSil(sepet_yemek_id:Int, kullanici_adi:String){ // cvm
    let params: Parameters = ["sepet_yemek_id":sepet_yemek_id, "kullanici_adi":kullanici_adi]
    AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response{ response in
      if let data = response.data{
        do{
          let res = try JSONDecoder().decode(CRUDResponse.self, from: data)
          if res.success == 1 {
            self.sepetGuncelle(kullanici_adi: kullanici_adi)
          }
        }catch{
          print("Sepetten yemek silmede hata var: \(error.localizedDescription)")
        }
      }
    }
  }
  
  //MARK: Detay sayfasında yapılan adet ayarlama işlemi
  func adetHesapla(sender: UIButton){
    if let buttonIdentifier = sender.accessibilityIdentifier {
      if buttonIdentifier == "minusButton" {
        let eskiDeger = (try? siparisMiktari.value()) ?? 1
        let yeniDeger = max(eskiDeger - 1, 1)
        siparisMiktari.onNext(yeniDeger)
        
      } else if buttonIdentifier == "plusButton" {
        let yeniDeger = (try? siparisMiktari.value()) ?? 1
        siparisMiktari.onNext(yeniDeger + 1)
      }
    }
  }
  
  //MARK:  Adet değiştikten sonra ürün miktarını hesapla
  func toplamUcretiHesapla(ucret: Int){
    let eskiUcret = (try? siparisMiktari.value()) ?? 1
    let yeniUcret = eskiUcret * ucret
    toplamUcret.onNext(yeniUcret)
  }
}
