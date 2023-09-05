import UIKit

class Urunler{
  var renk : String?
  var fiyat : Int?
  var stokDurum : Bool?
  
  init() { // Constructor - initial function --> bir classtan nesne oluşturduğumuzda oluşur.
    print("Boş constructer")
    
  }

//  init(renkX:String, fiyatX:Int, stokDurumX:Bool){
//    renk = renkX
//    fiyat = fiyatX
//    stokDurum = stokDurumX
//  }
  
  init(renk:String, fiyat:Int, stokDurum:Bool){
    self.renk = renk
    self.fiyat = fiyat
    self.stokDurum = stokDurum //shadowing - gölgeleme : class ile aynısını kullandığımızdan self kullanmamız.
    print("Dolu constructer")

  }
  
  func satisBaslat(){ //Side Effect --> Bir fonksiyonla bulunduğu class'ın özelliğini değiştirmeye denir.
    stokDurum = true
  }
  
  func satisDurdur(){
    stokDurum = false
  }
  
  func fiyatArtis(kacFiyat:Int){
    fiyat! += kacFiyat
//    fiyat = fiyat + kacFiyat
  }
    
  func fiyatAzalis(kacFiyat:Int){
    fiyat! -= kacFiyat
//    fiyat = fiyat - kacFiyat
  }
  
  
  func bilgiAl(){
    print("---------------------------")
    print("Renk       : \(renk!)")
    print("Fiyat      : \(fiyat!) ₺")
    print("Stok Durum : \(stokDurum!)")

  }
}

//NESNE OLUŞTURMA

let tv = Urunler(renk: "beyaz", fiyat: 8000, stokDurum: true)

//Değer Atama
tv.renk = "Siyah"
tv.fiyat = 10000
tv.stokDurum = true

//Değer Okuma
print("---------------------------")
print("Renk       : \(tv.renk!)")
print("Fiyat      : \(tv.fiyat!) ₺")
print("Stok Durum : \(tv.stokDurum!)")

tv.satisDurdur()
tv.bilgiAl()
tv.fiyatArtis(kacFiyat: 1000)
tv.bilgiAl()
tv.fiyatAzalis(kacFiyat: 2000)
tv.bilgiAl()

//Değer Atama
let saat = Urunler()
saat.renk = "mor"
saat.fiyat = 5000
saat.stokDurum = false

//Değer Okuma
//print("---------------------------")
//print("Renk       : \(saat.renk!)")
//print("Fiyat      : \(saat.fiyat!) ₺")
//print("Stok Durum : \(saat.stokDurum!)")

saat.bilgiAl() //fonksiyon olarak bilgi al tanımladık ve çağırdık. Nesne ile fonksiyon çalıştırıldı.

saat.satisBaslat()
saat.bilgiAl()
saat.fiyatArtis(kacFiyat: 2000)
saat.bilgiAl()

saat.fiyatAzalis(kacFiyat: 1000)
saat.bilgiAl()
