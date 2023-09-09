import UIKit

class Fonksiyonlar{
  
  //  SORU1 - Derece Dönüşümü
  func dereceToFahrenheit(derece:Double) -> Double{
    let fahrenheit = (derece * 9/5) + 32
    return fahrenheit
  }
}

let f = Fonksiyonlar()
let gelenSonuc = f.dereceToFahrenheit(derece: 5.0)
print("\(gelenSonuc) derece")


// SORU2 - Dikdörtgen Çevre Hesaplama
func dikdortgenCevreHesaplama(enKenar:Double, dikeyKenar: Double) -> Double{
  let cevre = 2 * (enKenar + dikeyKenar)
  return cevre
}

let uzunKenar = 10.0
let kisaKenar = 6.0
let cevre = dikdortgenCevreHesaplama(enKenar: uzunKenar, dikeyKenar: kisaKenar)
print("Dikdörtgenin çevresi: \(cevre) birim")

//SORU3 - Faktöriyel Değer Hesaplaması

func faktoriyelHesapla(sayi: Int) -> Int {
  if sayi <= 1 {
    return 1
  } else {
    return sayi * faktoriyelHesapla(sayi: sayi - 1)
  }
}

let girilenSayi = 6
let faktoriyel = faktoriyelHesapla(sayi: girilenSayi)
print("\(girilenSayi) sayısının faktöriyeli: \(faktoriyel)")

// SORU4- Kaç tane a harfi var?

func AHarfSayisi(kelime: String) {
  var sayac = 0
  for karakter in kelime {
    if karakter == "a" || karakter == "A" {
      sayac += 1
    }
  }
  
  print("\(kelime) kelimesinde \(sayac) adet 'a' harfi bulunuyor.")
}

let kelime = "Aleyna"
AHarfSayisi(kelime: kelime)

//Soru1 - İç Açı Toplamı

func icAciToplami(kenarSayisi: Int) -> Double {
  let toplamAciRadyan = Double(kenarSayisi - 2) * 180
  let icAciToplami = toplamAciRadyan
  return icAciToplami
}

let kenarSayisi = 6
let aciToplami = icAciToplami(kenarSayisi: kenarSayisi)
print("\(kenarSayisi) kenarlı çokgenin iç açılarının toplamı: \(aciToplami) radyan")

//SORU5 Çalışma saatine göre maaş hesabı

func maasHesapla(gunSayisi: Int, calismaSaatleri: Int) -> Double {
  let normalSaatUcreti: Double = 10.0
  let mesaiSaatUcreti: Double = 20.0
  let normalCalismaSaati: Int = 8
  let mesaiSiniri: Int = 160
  
  var toplamMaas: Double = 0.0
  
  if calismaSaatleri > normalCalismaSaati {
    let normalSaatler = min(calismaSaatleri, normalCalismaSaati * gunSayisi)
    let mesaiSaatler = max(0, calismaSaatleri - normalCalismaSaati * gunSayisi)
    
    toplamMaas = Double(normalSaatler) * normalSaatUcreti * Double(gunSayisi)
    
    if mesaiSaatler > 0 {
      let mesaiUcreti = mesaiSaatler >= mesaiSiniri ? mesaiSaatUcreti : normalSaatUcreti
      let mesaiMaasi = Double(mesaiSaatler) * mesaiUcreti * Double(gunSayisi)
      toplamMaas += mesaiMaasi
    }
  } else {
    toplamMaas = Double(calismaSaatleri) * normalSaatUcreti * Double(gunSayisi)
  }
  
  return toplamMaas
}

let gunSayisi = 6
let calismaSaatleri = 45
let maas = maasHesapla(gunSayisi: gunSayisi, calismaSaatleri: calismaSaatleri)
print("\(gunSayisi) gün boyunca \(calismaSaatleri) saat çalışmanın sonucunda alınan maaş: \(maas) ₺ ")

//SORU6 : Kota Miktarı
func kotaUcretiHesapla(kotaMiktariGB: Int) -> Double {
  let ucretBaslangic: Double = 100.0
  let kotaAsimiUcreti: Double = 4.0
  let kotaSiniri: Int = 50
  
  if kotaMiktariGB <= kotaSiniri {
    return ucretBaslangic
  } else {
    let kotaAsimiGB = kotaMiktariGB - kotaSiniri
    let kotaAsimiUcretiToplam = Double(kotaAsimiGB) * kotaAsimiUcreti
    return ucretBaslangic + kotaAsimiUcretiToplam
  }
}

let kotaMiktari = 70
let ucret = kotaUcretiHesapla(kotaMiktariGB: kotaMiktari)
print("\(kotaMiktari) GB kota için hesaplanan ücret: \(ucret) ₺")
