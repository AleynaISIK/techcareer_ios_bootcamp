//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 26.09.2023.
//

import Foundation
import RxSwift
import Alamofire

class KisilerDaoRepository {//Dao : Database Access Object
  var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
  
  func kaydet(kisi_ad:String,kisi_tel:String){
    var istek = URLRequest(url: URL(string : "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
    istek.httpMethod = "POST"
    let postString = "kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
    istek.httpBody = postString.data(using: .utf8)
    
    URLSession.shared.dataTask(with: istek){data,response,error in
      do{
        var cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
        print("----- INSERT ------")
        print("başarı :  \(cevap.success!)")
        print("mesaj :  \(cevap.message!)")
        
      }catch{
        print(error.localizedDescription)
      }
    } . resume()
  }
  
  func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
    var istek = URLRequest(url: URL(string : "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
    istek.httpMethod = "POST"
    let postString = "kisi_id=\(kisi_id)&kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
    istek.httpBody = postString.data(using: .utf8)
    
    URLSession.shared.dataTask(with: istek){data,response,error in
      do{
        var cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
        print("----- UPDATE ------")
        print("başarı :  \(cevap.success!)")
        print("mesaj :  \(cevap.message!)")
        
      }catch{
        print(error.localizedDescription)
      }
    } . resume()
  }
  
  func ara(aramaKelimesi:String){
    var istek = URLRequest(url: URL(string : "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
    istek.httpMethod = "POST"
    let postString = "kisi_ad=\(aramaKelimesi)"
    istek.httpBody = postString.data(using: .utf8)
    
    URLSession.shared.dataTask(with: istek){data,response,error in
      do{
        let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
        if let liste = cevap.kisiler{
          self.kisilerListesi.onNext(liste)
          
        }
      }catch{
        print(error.localizedDescription)
      }
    }.resume()
    
  }
  
  func sil(kisi_id:Int){
    var istek = URLRequest(url: URL(string : "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
    istek.httpMethod = "POST"
    let postString = "kisi_id=\(kisi_id)"
    istek.httpBody = postString.data(using: .utf8)
    
    URLSession.shared.dataTask(with: istek){data,response,error in
      do{
        var cevap = try JSONDecoder().decode(CRUDCevap.self, from: data!)
        print("----- DELETE ------")
        print("başarı :  \(cevap.success!)")
        print("mesaj :  \(cevap.message!)")
        
      }catch{
        print(error.localizedDescription)
      }
    } . resume()
  }
  
  func kisileriYukle(){
    let url = URL(string : "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
    
    URLSession.shared.dataTask(with: url){data,response,error in
      do{
        let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
        if let liste = cevap.kisiler{
          self.kisilerListesi.onNext(liste)
          
        }
      }catch{
        print(error.localizedDescription)
      }
    }.resume()
  }
}
