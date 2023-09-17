//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Aleyna IŞIK on 14.09.2023.
//

//     MARK: as! ve as? varsa downcasting sadece as ise upcasting dir!!!!

import UIKit

class Anasayfa: UIViewController {
  
  @IBOutlet weak var labelAnasayfa: UILabel!
  
  var sayac = 0
  
  override func viewDidLoad() {
//    Sayfa açıldığında 1 kere çalışır
    print("Yaşam döngüsü : viewDidLoad")
    super.viewDidLoad()
    labelAnasayfa.text = String(sayac)
  }
  
  override func viewWillAppear(_ animated: Bool) {
//    Sayfa her göründüğünde çalışır.
//    Sayfaya geri dönüşü takip edebilirsiniz.
    print("Yaşam döngüsü : viewWillAppear")

  }
  
  override func viewDidDisappear(_ animated: Bool) {
//    Sayfa her görünmez olduğunda çalışır. sayfadan ayrıldığınızda yani
    print("Yaşam döngüsü : viewDidDisappear")

  }
  
  @IBAction func buttonTikla(_ sender: Any) {
    sayac += 1
    labelAnasayfa.text = String(sayac)
    if sayac == 5{
      performSegue(withIdentifier: "oyunEkraninaGecis", sender: nil)
    }
  }
  
  @IBAction func buttonBasla(_ sender: Any) {
    let kisi = Kisiler(ad: "Aleyna", yas: 25, boy: 1.60, bekar: true)
    performSegue(withIdentifier: "oyunEkraninaGecis", sender: kisi)
    
    //  sondeki sender gönderilen mesaj sender veri gönderme için kullandığımız yapı
    //    performSegue(withIdentifier: "oyunEkraninaGecis", sender: "merhaba")
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print("prepare metodu çalıştı.")
    if segue.identifier == "oyunEkraninaGecis"{
      print("oyunEkraninaGecis çalıştı")}
    
    //    burda da veri aktarma işlemi yapıyoruz.
    if let veri = sender as? Kisiler { //Any(Superclass) > String(Subclass)
      print("Veri : \(veri)")
      let gidilecekVC = segue.destination as! OyunEkrani // UIViewController (Superclass) > OyunEkrani (Subclass)
      gidilecekVC.kisiNesnesi = veri
    }
  }
  
  @IBAction func buttonEkle(_ sender: Any) {
    print("Ekle tıklandı")
  }
  @IBAction func buttonCikis(_ sender: Any) {
    print("Çıkış tıklandı")

  }
  
}

