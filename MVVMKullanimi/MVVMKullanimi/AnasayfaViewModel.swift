//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Aleyna IŞIK on 26.09.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
  var sonuc = BehaviorSubject<String>(value: "0") //Tanımlama
  
  func topla(alinansayi1:String, alinanSayi2:String){
    if let sayi1 = Int(alinansayi1), let sayi2 = Int(alinanSayi2){
      let toplam = sayi1 + sayi2
      //sonuc = String(toplam)  rx swifti eklediğimiz için bu şekilde tanımlayamayız.
      sonuc.onNext(String(toplam)) //Tetikleme yapısını oluştyrduk şimdi de anasayfada dinlemeyi yapacağız.
    }
  }
  
  func carp(alinansayi1:String, alinanSayi2:String){
    if let sayi1 = Int(alinansayi1), let sayi2 = Int(alinanSayi2){
      let carp = sayi1 * sayi2
      sonuc.onNext(String(carp)) //Tetikleme yapısı
    }
  }
}
