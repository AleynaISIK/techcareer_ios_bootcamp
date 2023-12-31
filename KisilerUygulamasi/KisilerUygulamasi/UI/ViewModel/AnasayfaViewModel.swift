//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Aleyna IŞIK on 26.09.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
  
  var krepo = KisilerDaoRepository()
  var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())

  
  init(){
    krepo.veritabaniKopyala()
    kisilerListesi = krepo.kisilerListesi
  }
  
  func ara(aramaKelimesi : String){
    krepo.ara(aramaKelimesi: aramaKelimesi) 
  }
  
  func sil(kisi_id : Int){
    krepo.sil(kisi_id: kisi_id)
    kisileriYukle() //sildiğimiz veriler gitmesi için güncelleme yapıyoruz.
  }
  
  func kisileriYukle(){
    krepo.kisileriYukle()
  }
  
}
