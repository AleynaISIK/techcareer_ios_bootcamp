import UIKit

//05.09.2023
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

//07.09.2023
class Fonksiyonlar{
  //void: geri dönüş değeri olmayan
  func selamla1(){
    let sonuc = "Merhaba Ahmet"
    print(sonuc)
  }
  
  //return: geri dönüş değeri olan
  func selamla2() -> String{
    let sonuc = "Merhaba Mehmet"
    return sonuc
  }
  //    parametre
  func selamla3(isim:String){
    let sonuc = "Merhaba \(isim)"
    print(sonuc)
  }
  
  func toplam (sayi1:Int, sayi2:Int) ->Int{
    let toplam = sayi1 + sayi2
    return toplam
  }
  
  //  Overloading
  func carpma(sayi1:Int, sayi2:Int){
    print("Çarpma: \(sayi1 *  sayi2)")
  }
  
  func carpma(sayi1:Double, sayi2:Double){
    print("Çarpma: \(sayi1 *  sayi2)")
  }
  
  func carpma(sayi1:Int, sayi2:Int, isim:String){
    print("Çarpma: \(sayi1 *  sayi2) - İşlem yapan :\(isim)")
  }
}

let f = Fonksiyonlar()

f.selamla1()

let gelenSonuc = f.selamla2()
print("Gelen Sonuç : \(gelenSonuc)")

f.selamla3(isim:"Aleyna")

let gelenToplam = f.toplam (sayi1: 10, sayi2: 20)
print("Gelen Toplam: \(gelenToplam)")

f.carpma(sayi1: 3, sayi2: 5, isim: "Aleyna")

print("-----------------------------")

class ASinifi{
  static var x = 10
  static func metot(){
    print("Metot çalıştı")
  }
}

let a = ASinifi() //burda bi a sınıfı nesnesi oluşturuldu a ya atandı

//print(a.x)
//a.metot()
//
////  Virtual Object - Sanal Nesne * nameless object - isimsiz nesne
//print(ASinifi().x) //yukarıdakiyle aynı sonucu verdi fakat ismi yok ama nesne oluşturuldu .. 1.nesne
//ASinifi().metot() //2.nesne - isim vermeden oluşturulup kullanaılan şeye sanal nesne deniyor.

print(ASinifi.x)
ASinifi.metot()

//static = companion object (kotlin)


//Enum - Enumaration

enum KonserveBoyut{ //enumlar kucuk harfle yazılır.
  case kucuk
  case orta
  case buyuk
}

func ucretHesapla(boyut:KonserveBoyut,adet:Int){
  switch boyut{
  case .kucuk: print("Ücret : \(adet * 18) ₺")
  case .orta: print("Ücret  : \(adet * 25) ₺")
  case .buyuk: print("Ücret : \(adet * 47) ₺")
    
  }
}

ucretHesapla(boyut: .orta, adet: 150)

//Composition
//Foreign key : fk

class Kategoriler{
  var kategori_id: Int?
  var kategori_ad:String?
  
  init(kategori_id:Int,kategori_ad:String){
    self.kategori_id = kategori_id
    self.kategori_ad = kategori_ad
  }
}

class Yonetmenler{
  var yonetmen_id: Int?
  var yonetmen_ad: String?
  
  init(yonetmen_id:Int,yonetmen_Ad:String){ //bu işlem shadowing işlemi
    self.yonetmen_id = yonetmen_id
    self.yonetmen_ad = yonetmen_Ad
  }
}
class Filmler{
  var film_id :Int?
  var film_ad: String?
  var film_yil: Int?
  var kategori:Kategoriler? //Compasition
  var yonetmen:Yonetmenler?//Compasition : bir class içinde başka classlar kullanmak
  
  init(film_id:Int,film_ad:String,film_yil:Int,kategori:Kategoriler, yonetmen:Yonetmenler){
    self.film_id = film_id
    self.film_ad = film_ad
    self.film_yil = film_yil
    self.kategori = kategori
    self.yonetmen = yonetmen
  }
}

let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Bilim kurgu")

let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_Ad: "Quentin Tarantino")
let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_Ad: "Christopher Nolan")

let f1 = Filmler(film_id: 1, film_ad: "Django", film_yil: 2013, kategori: k1, yonetmen: y1)

print("Film id      : \(f1.film_id!)")
print("Film ad      : \(f1.film_ad!)")
print("Film yıl     : \(f1.film_yil!)")
print("Film kategori: \(f1.kategori!.kategori_ad!)")
print("Film yönetmen: \(f1.yonetmen!.yonetmen_ad!)")

