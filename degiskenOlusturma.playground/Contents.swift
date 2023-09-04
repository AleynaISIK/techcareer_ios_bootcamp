import UIKit

print("Merhaba Dünya")

var ogrenciAdi = "Aleyna"
var ogrenciYas = 24
var ogrenciBoy = 1.61
var ogrenciBasharf = "A"
var ogrenciDevamEdiyorMu = true

print(ogrenciAdi)
print(ogrenciBoy)
print(ogrenciYas)
print(ogrenciBasharf)
print(ogrenciDevamEdiyorMu)

var urun_id: Int = 3416
var urun_adi: String = "Kol Saati"
var urun_adet: Int = 100
var urun_fiyat: Double = 149.99
var urun_tedarikci: String = "Rolex"

print("Ürün id        : \(urun_id)")
print("Ürün Adı       : \(urun_adi)")
print("Ürün Adet      : \(urun_adet)")
print("Ürün fiyat     : \(urun_fiyat) ₺")
print("Ürün tedarikçi : \(urun_tedarikci)")

//Comment Line
//Constant - Sabit
//Swift(let) - Kotlin(val) - Dart,Java(final) -const

var sayi = 10
print(sayi)
sayi = 99
print(sayi)

let numara = 20
print(numara)

//tür dönüşümü - type casting

//sayısal --> sayısal
var i = 43
var d = 56.78

var sonuc1 = Double(i)
var sonuc2 = Int(d)

print(sonuc1 , sonuc2)

//Sayısal --> Metin

var sonuc3 = String(i)
var sonuc4 = String(d)
print(sonuc3, sonuc4)

// Metin --> Sayısal

var yazi  = "34t"

if let sonuc5 = Int(yazi){ //optinal binding if let yapısı
  print(sonuc5)

}else{
  print("Dönüşüm hatası")
}
