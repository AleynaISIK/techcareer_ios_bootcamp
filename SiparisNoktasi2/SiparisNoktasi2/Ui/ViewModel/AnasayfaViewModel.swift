//
//  HomePageViewModel.swift
//  SiparisNoktasi2
//
//  Created by Aleyna IŞIK on 07.10.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
  
  var krepo            = YemeklerDaoRepository()
  var yemeklerListesi  = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
  var yemekDetayListe  = BehaviorSubject<[YemekDetay]>(value: [YemekDetay]())
  var siparisMiktari   = BehaviorSubject<Int>(value: 1)

  let yemekFiltre      = ["4", "5","8","9","10","11"]
  let tatliFiltre      = ["2", "6", "13", "14"]
  let icecekFiltre     = ["1", "3", "7", "12"]
  
  init(){
    yemeklerListesi = krepo.yemekListesi
    siparisMiktari  = krepo.siparisMiktari
    yemekDetayListe = krepo.yemekDetayListe
  }
  
  func yemekleriYukle(){
    krepo.yemekleriYukle()
  }
  
  func ara(aramaKelimesi:String){
    krepo.ara(aramaKelimesi: aramaKelimesi)
  }
  
  func ketegori(idList: [String]){
    krepo.kategori(yemekFiltrele: idList)
  }
  
  func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String ){
    krepo.sepeteEkle(yemek_adi: yemek_adi,
                    yemek_resim_adi: yemek_resim_adi,
                    yemek_fiyat: yemek_fiyat,
                    yemek_siparis_adet: yemek_siparis_adet,
                    kullanici_adi: kullanici_adi)
  }
  
  func sepetGuncelle(kullanici_adi: String){
    krepo.sepetGuncelle(kullanici_adi: kullanici_adi )
  }
  
  
  func sepettenSil(sepet_yemek_id: Int, kullanici_adi: String){
    krepo.sepettenSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
  }
  
  func sepetEklemeKontrol(yemekDetay : [YemekDetay], yemek: Yemekler?, viewModel: AnasayfaViewModel){
    
    var kadi = false
    var y = YemekDetay()
    for i in yemekDetay{
      if let yemekAdi = i.yemek_adi{
        if yemekAdi == yemek!.yemek_adi{
          kadi = true
          y = i
          break
        } else {
          kadi = false
        }
      }
    }
    
    if kadi {
      viewModel.sepettenSil(sepet_yemek_id: Int(y.sepet_yemek_id!)! , kullanici_adi: "Aleyna")
      if let yemek = yemek{
        viewModel.sepeteEkle(yemek_adi: yemek.yemek_adi ?? "yemek bulunamadı",yemek_resim_adi: yemek.yemek_resim_adi! ,
                            yemek_fiyat: (Int((yemek.yemek_fiyat)!)! * (1 + Int(y.yemek_siparis_adet!)!)) ,
                            yemek_siparis_adet: 1 + Int(y.yemek_siparis_adet!)!,kullanici_adi: "Aleyna")
      }
    } else {
      if let yemek = yemek{
        let miktar = (try? viewModel.siparisMiktari.value()) ?? 1
        viewModel.sepeteEkle(yemek_adi: yemek.yemek_adi!,yemek_resim_adi: yemek.yemek_resim_adi! ,
                             yemek_fiyat: (Int((yemek.yemek_fiyat)!)! * miktar) ,
                            yemek_siparis_adet: miktar,kullanici_adi: "Aleyna")
      }
    }
  }
}
