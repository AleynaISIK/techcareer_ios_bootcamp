import UIKit

//MARK: OOP Kuralı - Kalıtım (Inheritance)

//Mevcut bir sınıftan başka bir sınıf türetmek için kullanılır. Üst sınıfa superclass denir. Alt sınıfa subclass denir. Bir sınıfın tek kalıtımı olabilir!!!

class Ev{
  var pencereSayisi: Int?
  
  init(penceresayisi:Int){
    self.pencereSayisi = penceresayisi
  }
}

class Saray : Ev {
  var kuleSayisi: Int?
  
  init(kuleSayisi:Int, pencereSayisi:Int){
    self.kuleSayisi = kuleSayisi
    super.init(penceresayisi: pencereSayisi)
  }
}

class Villa : Ev {
  var garajVarmi:Bool?
  
  init(garajVarmi:Bool, pencereSayisi:Int) {
    self.garajVarmi = garajVarmi
    super.init(penceresayisi: pencereSayisi)
  }
}

let topkapiSarayi = Saray(kuleSayisi: 5, pencereSayisi: 300)
let bogazVilla = Villa(garajVarmi: true, pencereSayisi: 50)

print(topkapiSarayi.kuleSayisi!)
print(topkapiSarayi.pencereSayisi!)

print(bogazVilla.garajVarmi!)
print(bogazVilla.pencereSayisi!)

//MARK: Downcasting - UpCasting
//Downcasting ve UpCasting olması için kalıtım ilişkişi olmak  ZORUNDA!

//MARK: Upcasting
// Saray > Ev aşağıdan yukarıya dönüştüreceğiz.
let ev = Saray(kuleSayisi: 3, pencereSayisi: 100) as Ev


//MARK: Downcasting
// Ev> Saray
//-as? -> hata olursa nil olacak , as! -> hata varsa uygulama çökecek
let saray = Ev(penceresayisi: 40) as? Saray //as! Saray


//MARK: Tip Kontrol
if ev is Ev{ //instanceOf
  print("Nesne ev sınıfından türetilmiştir")
}else{
  print("Nesne ev sınıfından türetilmemiştir")
}

//OVERRİDİNG İLE OVERLOADİNG ARASI FARK **
//Overriding : metodları ezme : üst sınıfın metodlarının alt sınıf tarafından tekrar kullanılmasıdır.
class Hayvan{
  func sesCikar(){
    print("Sesim yok")
  }
}

class Memeli : Hayvan {
  
}

class Kedi : Memeli {
  override func sesCikar() {
    print("Miyav Miyav")
  }
}

class Kopek : Memeli {
  override func sesCikar() {
    print("Hav hav")
  }
}

let hayvan = Hayvan()
let memeli = Memeli()
let kedi = Kedi()
let kopek = Kopek()

hayvan.sesCikar() //Kalıtım yok, kendi metoduna erişti.
memeli.sesCikar() // Kalıtım var, üst sınıfın metoduna erişti
kedi.sesCikar() // Kalıtım var, kendi metoduna erişti
kopek.sesCikar() // Kalıtım var, kendi metoduna erişti


// MARK: Protokol : javada interface olarak bilinir. protokoller 1 den fazla olabilir. bir sınıfı birden fazla protocol alabilir.

//PROTOCOL - Interface

protocol MyProtocol{
  var degisken : Int{ get set }
  
  func metod()
  func metod2() -> String
}

class ClassA : MyProtocol {
  
  var degisken: Int = 10
  
  func metod() {
    print("Metod1 çalıştı")
  }
  
  func metod2() -> String {
    return "Metod2 çalıştı"
  }
  
  
}

let classA = ClassA()
print(classA.degisken)
classA.metod()
print(classA.metod2())

//Extension
extension Int {
  func carp(sayi: Int) -> Int {
    return self * sayi
  }
}

let sonuc = 5.carp(sayi: 3)
print("Sonuç : \(sonuc)")

//Closure : fonksiyon benzeri

let ifade = {
  print("Closure çalıştı")
}

ifade()

//Collection Types : array, set, dictionary
//Array ile set arasındaki fark sorulur. Çalışması çok benzer. set'in içerisine bir şeyler eklesekte içerisini karıştırır yani spotify a müzik eklediğimizi düşünelim bununla karışık çalar. 0 dan başlar index mekanızması var. 2. fark ise tekrar eklemeye izin vermez . 1 tane olabilir sadece.

