//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Aleyna IŞIK on 26.09.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository{ //Dao: Database Access Object
  
  var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
  
  let db : FMDatabase? //database e erişmek için..
  
  init(){
    let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let veriTabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
    db = FMDatabase(path: veriTabaniURL.path)
  }
  
  func kaydet(kisi_ad : String, kisi_tel: String){
    print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)")
    
  }
  
  func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
    print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    
  }
  
  func ara(aramaKelimesi : String){
    print("Kişi ara : \(aramaKelimesi)")
  }
  
  func sil(kisi_id : Int){
    print("Kişi sil : \(kisi_id)")
  }
  
  func kisileriYukle(){
    
    
    db?.open()
    
    var liste = [Kisiler]()
    
    do{
      let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil) //burda select sorgusu yapıyoruz
      
      while rs.next(){
        let kisi_id = Int(rs.string(forColumn: "kisi_id"))!
        let kisi_ad = rs.string(forColumn: "kisi_ad")!
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
