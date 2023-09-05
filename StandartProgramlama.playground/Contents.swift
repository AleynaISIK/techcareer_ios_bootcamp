import UIKit

print("sksk")

//Karşılaştırma Operatörleri
var a = 40
var b = 50

var x = 90
var y = 80

print("a == b : \(a == b)")
print("a != b : \(a != b)")
print("a > b  : \(a > b)")
print("a >= b : \(a >= b)")
print("a < b  : \(a < b)")
print("a <= b : \(a <= b)")

print("a > b || x > y : \(a > b || x > y)") //OR(VEYA) false || false : false , diğer durumlarda hep true

print("a > b && x > y : \(a > b && x > y)") //AND(VE) true && true : true , diğer durumlarda hep false

//if kullanımı

var yas = 16
var isim = "Mehmet"

if yas >= 18 {
  print("Reşitsiniz")
}else{
  print("Reşit değilsiniz")
}


if isim == "Aleyna" {
  print("Merhaba Aleyna")
}else if isim == "Mehmet"{
  print("Merhaba Mehmet")
}else{
  print("Tanınmayan kişi")
}

//AND Örneği
var ka = "admin"
var s = 123456

if ka == "admin" && s == 123456 {
  print("Hoşgeldiniz")
}else{
  print("Hatalı Giriş!!")
}

//OR Örneği

var sonuc = 10

if sonuc == 10 || sonuc == 20 {
  print("Sonuç 10 veya 20 dir")
}else{
  print("Sonuç 10 veya 20 değildir")
}


var z = 10
var t = 20


z == t ? print("Eşit") : print("Eşit değil") //Ternary

//Switch
//Kotlin ( when)

var gun = 3

switch gun {
case 1: print("Pazartesi")
case 2: print("Salı")
case 3: print("Çarşamba")
case 4: print("Perşembe")
case 5: print("Cuma")
case 6: print("Cumartesi")
case 7: print("Pazar")
  
default: print("Böyle bir gün yok")
}

//LOOP - Döngüler

//1,2,3
for i in 1...3{ //Kotlin de arada 2 nokta var 3 değil. -- for each döngüsü
  print("Döngü 1: \(i)")
}

//10 ile 20 arasında 5 er artış

for k in stride(from: 10, through: 20, by: 5 ){
  print("Döngü 2: \(k)")
}

//10 ile 20 arasında 5 er azalış

for k in stride(from: 20, through: 10, by: -5 ){
  print("Döngü 3: \(k)")
}


//1,2,3
var sayac = 1

while sayac < 4 {
  print("Döngü 4: \(sayac)")
  sayac += 1
}

for i in 1...5{
  if i == 3 {
    break
  }
  print("Döngü 5: \(i)")
}

for i in 1...5{
  if i == 3 {
    continue
  }
  print("Döngü 6: \(i)")
}
