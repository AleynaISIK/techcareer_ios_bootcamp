//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 26.09.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

class KisilerDaoRepository {//Dao : Database Access Object
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
  var collectionKisiler = Firestore.firestore().collection("Kisiler")
  
  func kaydet(kisi_ad:String,kisi_tel:String){
    let yeniKisi: [String:Any] = ["kisi_id":"", "kisi_ad":kisi_ad,"kisi_tel":kisi_tel]
    collectionKisiler.document().setData(yeniKisi)
        print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)")
    }
    
    func guncelle(kisi_id:String,kisi_ad:String,kisi_tel:String){
        print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
      let guncellenenKisi: [String:Any] = ["kisi_ad" : kisi_ad, "kisi_tel":kisi_tel]
      collectionKisiler.document(kisi_id).updateData(guncellenenKisi)
    }
    
    func ara(aramaKelimesi:String){
      
//      let sorgu = collectionKisiler.whereField("kisi_ad", isEqualTo:aramaKelimesi)
       
      collectionKisiler.addSnapshotListener{ snapshot,error in
        var liste = [Kisiler]()
        
        if let documents = snapshot?.documents{
          for document in documents{ //sırayla dökümanları verecek.
            let data = document.data()
            let kisi_id = document.documentID
            let kisi_Ad = data["kisi_ad"] as? String ?? ""
            let kisi_tel = data["kisi_tel"] as? String ?? ""
            
            if kisi_Ad.lowercased().contains(aramaKelimesi.lowercased()){
              let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_Ad, kisi_tel: kisi_tel)
              liste.append(kisi)
            }
          }
        }
        
        self.kisilerListesi.onNext(liste)
        
      }
    }
    
    func sil(kisi_id:String){
      collectionKisiler.document(kisi_id).delete()
        print("Kişi Sil : \(kisi_id)")
    }
    
    func kisileriYukle(){
      
      let sorgu = collectionKisiler.order(by: "kisi_ad") //ASC : ascending : küçükten>büyüğe
       
      collectionKisiler.addSnapshotListener{ snapshot,error in
        var liste = [Kisiler]()
        
        if let documents = snapshot?.documents{
          for document in documents{ //sırayla dökümanları verecek.
            let data = document.data()
            let kisi_id = document.documentID
            let kisi_Ad = data["kisi_ad"] as? String ?? ""
            let kisi_tel = data["kisi_tel"] as? String ?? ""
            
            let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_Ad, kisi_tel: kisi_tel)
            liste.append(kisi)
          }
        }
        
        
        self.kisilerListesi.onNext(liste)
        
      }
    }
}
