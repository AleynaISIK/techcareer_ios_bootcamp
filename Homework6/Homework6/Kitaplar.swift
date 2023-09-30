//
//  Kitaplar.swift
//  Homework6
//
//  Created by Aleyna IŞIK on 29.09.2023.
//

import Foundation

class Kitaplar{
  var id:Int?
  var kitap_ad:String?
  var yazar_ad:String?
    var kitap_resim:String?
  
  init(id: Int, kitap_ad: String, yazar_ad: String, resim: String) {
    self.id = id
    self.kitap_ad = kitap_ad
    self.yazar_ad = yazar_ad
    self.kitap_resim = resim
  }
}

class Kirtasiye{
  var id:Int?
  var kirtasiye_malzemesi_ad:String?
  var kirtasiye_malzemesi_resim:String?
  
  init(id: Int, kirtasiye_malzemesi_ad: String, kirtasiye_malzemesi_resim: String) {
    self.id = id
    self.kirtasiye_malzemesi_ad = kirtasiye_malzemesi_ad
    self.kirtasiye_malzemesi_resim = kirtasiye_malzemesi_resim
  }
}

class Teknoloji{
  var id:Int?
  var teknoloji_urun_ad:String?
  var teknoloji_urun_resim:String?
  
  init(id: Int, teknoloji_urun_ad: String, teknoloji_urun_resim: String) {
    self.id = id
    self.teknoloji_urun_ad = teknoloji_urun_ad
    self.teknoloji_urun_resim = teknoloji_urun_resim
  }
}

class PopulerUrunler{
  var id:Int?
  var populer_urun_ad:String?
  var populer_urun_resim:String?
  
  init(id: Int, populer_urun_ad: String, populer_urun_resim: String) {
    self.id = id
    self.populer_urun_ad = populer_urun_ad
    self.populer_urun_resim = populer_urun_resim
  }
}
