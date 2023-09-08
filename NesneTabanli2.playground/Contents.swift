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
