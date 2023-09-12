import UIKit

var numaralar = [10,20,30] //0 --> 10  1-->20
var meyveler = [String]() //  Boş array

//Veri ekleme
meyveler.append("Elma")
meyveler.append("Muz")
meyveler.append("Kiraz")
print(meyveler)

//Güncelleme
meyveler[0] = "Yeni elma"
print(meyveler)

//Insert
meyveler.insert("Portakal", at: 1)
print(meyveler)

//Veri alma
let meyve = meyveler[2]
print(meyve)

print("Boş kontrol  : \(meyveler.isEmpty)")
print("Boyut        : \(meyveler.count)") //size
print("İlk eleman   : \(meyveler.first!)") //0.
print("Son eleman   : \(meyveler.last!)") // Son indeks = (meyveler.count - 1)
print("İçeriyor mu  : \(meyveler.contains("Muz"))")
print("İndeks bulma : \(meyveler.firstIndex(of: "Kiraz")!)")

for meyve in meyveler { //for each
  print("Sonuç : \(meyve)")
}

for (indeks,meyve) in meyveler.enumerated() {
  print("\(indeks). -> \(meyve)")
}

meyveler.remove(at: 1)
print(meyveler)

meyveler.removeAll() //clear
print(meyveler)

//Nesne Tabanlı
class Yemekler {
  var id: Int?
  var ad: String?
  var fiyat: Int?
  var puan: Double?
  
  init(id:Int,ad: String,fiyat:Int,puan:Double){
    self.id = id
    self.ad = ad
    self.fiyat = fiyat
    self.puan = puan
  }
}

var y1 = Yemekler(id: 1, ad: "Köfte", fiyat: 80, puan: 4.6)
var y2 = Yemekler(id: 2, ad: "Ayran", fiyat: 30, puan: 3.8)
var y3 = Yemekler(id: 3, ad: "Tramisu", fiyat: 60, puan: 4.3)

var yemekListesi = [Yemekler]()
yemekListesi.append(y1)
yemekListesi.append(y2)
yemekListesi.append(y3)

for y in yemekListesi{
  print("id : \(y.id!) - Ad : \(y.ad!) - Fiyat : \(y.fiyat!) ₺ - Puan : \(y.puan!)")
}

//Filtreleme

print("------------------ Filtreleme 1 ------------------")
var f1 = yemekListesi.filter({ $0.fiyat! > 50 && $0.fiyat! < 70 })
for y in f1{
  print("id : \(y.id!) - Ad : \(y.ad!) - Fiyat : \(y.fiyat!) ₺ - Puan : \(y.puan!)")
}

print("------------------ Filtreleme 2 ------------------")
var f2 = yemekListesi.filter({ $0.ad!.contains("an") })
for y in f2{
  print("id : \(y.id!) - Ad : \(y.ad!) - Fiyat : \(y.fiyat!) ₺ - Puan : \(y.puan!)")
}

//Sorting - Sıralama
print("------------------ Fiyat : Artan ------------------")
var f3 = yemekListesi.sorted(by: { $0.fiyat! > $1.fiyat! })
for y in f3{
  print("id : \(y.id!) - Ad : \(y.ad!) - Fiyat : \(y.fiyat!) ₺ - Puan : \(y.puan!)")
}

print("------------------ Fiyat : Azalan ------------------")
var f4 = yemekListesi.sorted(by: { $0.fiyat! < $1.fiyat! })
for y in f4{
  print("id : \(y.id!) - Ad : \(y.ad!) - Fiyat : \(y.fiyat!) ₺ - Puan : \(y.puan!)")
}
