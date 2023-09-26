//
//  MatematikRepository.swift
//  MVVMKullanimi
//
//  Created by Aleyna IŞIK on 26.09.2023.
//

import Foundation
import RxSwift

class MatematikRepository {
  var sonuc = BehaviorSubject<String>(value: "0") //Tanımlama
  var mrepo = MatematikRepository()
  
  init(){
    sonuc = mrepo.sonuc //Bağlantı
  }
  
  func topla(alinansayi1:String, alinanSayi2:String){
    mrepo.topla(alinansayi1: alinansayi1, alinanSayi2: alinanSayi2  )
  }
  
  func carp(alinansayi1:String, alinanSayi2:String){
    mrepo.carp(alinansayi1: alinansayi1, alinanSayi2: alinanSayi2  )
  }
}
