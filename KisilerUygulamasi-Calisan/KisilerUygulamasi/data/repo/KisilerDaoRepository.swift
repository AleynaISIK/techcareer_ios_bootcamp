//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 26.09.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository {//Dao : Database Access Object
  var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
  
  let db:FMDatabase?
  
  init(){
    let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
    db = FMDatabase(path: veritabaniURL.path)
  }
  
  func kaydet(kisi_ad:String,kisi_tel:String){
    db?.open()
    do{
      try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
    }catch{
      print(error.localizedDescription)
    }
    
    db?.close()
    //        print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)")
  }
  
  func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
    db?.open()
    do{
      try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad,kisi_tel,kisi_id])
    }catch{
      print(error.localizedDescription)
    }
    
    db?.close()
  }
  
  func ara(aramaKelimesi:String){
    db?.open()
    
    var liste = [Kisiler]()
    
    do{
      let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%' ", values: nil)
      
      while rs.next() {
        let kisi_id  = Int(rs.string(forColumn: "kisi_id"))!
        let kisi_ad  = rs.string(forColumn: "kisi_ad")!
        let kisi_tel = rs.string(forColumn: "kisi_tel")!
        
        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
        liste.append(kisi)
      }
      
      kisilerListesi.onNext(liste)
    }catch{
      print(error.localizedDescription)
    }
    db?.close()
  }
  
  func sil(kisi_id:Int){
    db?.open()
    do{
      try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
    }catch{
      print(error.localizedDescription)
    }
    
    db?.close()
  }
  
  func kisileriYukle(){
    db?.open()
    
    var liste = [Kisiler]()
    
    do{
      let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
      
      while rs.next() {
        let kisi_id  = Int(rs.string(forColumn: "kisi_id"))!
        let kisi_ad  = rs.string(forColumn: "kisi_ad")!
        let kisi_tel = rs.string(forColumn: "kisi_tel")!
        
        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
        liste.append(kisi)
      }
      
      kisilerListesi.onNext(liste)
    }catch{
      print(error.localizedDescription)
    }
    db?.close()
  }
  
  func veritabaniKopyala(){
    let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite") //veritabanı ismi ve yolu ile ulaştık.
    let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite") //hedef yola kullanılacak vt eklendi.
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: kopyalanacakYer.path){ //varsa kopyalamaz
      print("Veritabanı zaten var")
    }else{
      do{
        try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path) //yoksa kopyalar
      }catch{}
    }
  }
}
