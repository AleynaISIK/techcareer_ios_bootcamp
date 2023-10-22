//
//  YemeklerDaoRepository.swift
//  SiparisNoktasi
//
//  Created by Aleyna IŞIK on 18.10.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore
import Alamofire

class YemeklerDaoRepository {//Dao : Database Access Object
    var yemeklerListesi = BehaviorSubject<[Yemekler]>(value: [Yemekler]())
    var collectionYemekler = Firestore.firestore().collection("Yemekler")
    
    func kaydet(yemek_adi:String,yemek_fiyat:String){
        let yeniKisi:[String:Any] = ["yemek_id":"","yemek_adi":yemek_adi,"yemek_fiyat":yemek_fiyat]
      collectionYemekler.document().setData(yeniKisi)
    }
    
    func guncelle(yemek_id:String,yemek_adi:String,yemek_fiyat:String){
        let guncellenenKisi:[String:Any] = ["kisi_ad":yemek_adi,"yemek_fiyat":yemek_fiyat]
      collectionYemekler.document(yemek_id).updateData(guncellenenKisi)
    }
    
    func ara(aramaKelimesi:String){
        //let sorgu = collectionKisiler.whereField("kisi_ad", isEqualTo: aramaKelimesi)
        
      collectionYemekler.addSnapshotListener{ snapshot,error in
            var liste = [Yemekler]()
            
            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    
                    let yemek_id = document.documentID
                    let yemek_adi = data["yemek_adi"] as? String ?? ""
                    let yemek_fiyat = data["yemek_fiyat"] as? String ?? ""
                    let yemek_resim_adi = data["yemek_resim_adi"] as? String ?? ""

                    
                    if yemek_adi.lowercased().contains(aramaKelimesi.lowercased()) {
                      let kisi = Yemekler(yemek_id: yemek_id, yemek_adi: yemek_adi, yemek_fiyat: yemek_fiyat, yemek_resim_adi: yemek_resim_adi)
                        liste.append(kisi)
                    }
                }
            }
            
            self.yemeklerListesi.onNext(liste)
        }
    }
    
    func sil(yemek_id:String){
      collectionYemekler.document(yemek_id).delete()
    }
    
    func yemekleriYukle(){
      AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response{ response in
        if let data = response.data{
          do{
            let res = try JSONDecoder().decode(YemeklerCevap.self, from: data)
            if let list = res.yemekler{
              self.yemeklerListesi.onNext(list)
            }
          }catch{
            print("Anasayfa yüklemede hata var : \(error.localizedDescription)")
          }
        }
      }
    }
}
