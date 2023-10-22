//
//  HomePageViewModel.swift
//  SiparisNoktasi
//
//  Created by Aleyna IŞIK on 18.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    var krepo = YemeklerDaoRepository()
    var yemekListesi = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
    
    init(){
      yemekListesi = krepo.yemeklerListesi
    }
    
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(yemek_id:String){
        krepo.sil(yemek_id: yemek_id)
    }
    
    func yemekleriYukle(){
      krepo.yemekleriYukle()
    }
}
