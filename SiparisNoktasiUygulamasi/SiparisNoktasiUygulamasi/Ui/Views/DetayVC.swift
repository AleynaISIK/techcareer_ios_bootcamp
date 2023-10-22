//
//  DetayVC.swift
//  SiparisNoktasiUygulamasi
//
//  Created by Aleyna IŞIK on 09.10.2023.
//

import UIKit

class DetayVC: UIViewController {
  
  var viewModel  = DetayViewModel()
  var yemek      : Yemekler?
  var yemekDetay = [YemekDetay]()
  var izinKontrol = false
  
  @IBOutlet weak var yemekImageview: UIImageView!
  @IBOutlet weak var yemekAdiLabel: UILabel!
  @IBOutlet weak var AdetLabel: UILabel!
  @IBOutlet weak var ucretLabel: UILabel!
  
  @IBOutlet weak var zamanlabel: UILabel!
  @IBOutlet weak var yildizlabel: UILabel!
  @IBOutlet weak var aciklamaLabel: UILabel!
  
  let detaylar = [
      ["yildiz": "4.7", "aciklama": "Ayran, her zaman ferahlamanızı sağlayacak harika bir içecektir. Evde veya dışarıda, yemeklerinizin yanında veya sadece atıştırmalık olarak her an keyifle içebilirsiniz.", "hazirlamaZamani": "5 dk"],
      ["yildiz": "4.9", "aciklama": "Ince yufkaların kat kat arasına, damak zevkinize göre ceviz, antep fıstığı, badem veya fındık eklenerek hazırlanan bu lezzetli tatlı, genellikle tatlı şerbeti ile tatlandırılır. Servis edildiğinde ise çıtır çıtır bir deneyim sunar", "hazirlamaZamani": "10 dk"],
      ["yildiz": "4.8", "aciklama": "Fanta'nın canlandırıcı meyve notaları, yemeklerinizin lezzetini zirveye taşır.", "hazirlamaZamani": "0 dk"],
      ["yildiz": "4.5", "aciklama": "Dumanı üstünde tüten bu özel hazırlanan somonu hala tatmadınız mı? Izgara somonun lezzeti benzersizdir.", "hazirlamaZamani": "35 dk"],
      ["yildiz": "4.9", "aciklama": "Efsane tadıyla sizi büyüleyecek olan bu özel ızgara tavuğu denemeden geçmeyin. Her biri özenle hazırlanır.", "hazirlamaZamani": "25 dk"],
      ["yildiz": "5.0", "aciklama": "Fırında kızartılan kadayıfın katmanlarına tercihinize göre fıstık veya ceviz gibi özel lezzetler eklenir, ardından tatlı bir şurupla taçlandırılarak servise sunulur.", "hazirlamaZamani": "30 dk"],
      ["yildiz": "3.9", "aciklama": "Kahve telvesi ve sıcak kumun muhteşem dansıyla pişen kahve, lezzetin derinliklerine inmenize yardımcı olur ve servis edilirken bol köpüğüyle büyülenmenizi sağlar.", "hazirlamaZamani": "15 dk"],
      ["yildiz": "4.8", "aciklama": "Kıyma ve özel baharatlarla hazırlanan bu muhteşem lezzet, eşsiz bir tat deneyimi sunuyor. İşte tam anlamıyla köfte tutkunlarının hayran olacağı bir lezzet!", "hazirlamaZamani": "20 dk"],
      ["yildiz": "4.9", "aciklama": "Lazanya, peynir, domates sosu veya enfes ragù ile bir araya getirilen çok katmanlı bir lezzettir. Yaratıcılığınızı konuşturabileceğiniz ve ricotta veya mozzarella gibi peynirlerle tatlandırabileceğiniz bir lezzet şöleni sunar.", "hazirlamaZamani": "30 dk"],
      ["yildiz": "5", "aciklama": "Makarna, geleneksel İtalyan mutfağının temel besini ve bu özel sosla kaçırılmaz bir lezzettir.", "hazirlamaZamani": "25 dk"],
      ["yildiz": "4.9", "aciklama": "Pizza, çeşitli lezzetlerin birleştiği, İtalyan mutfağının özgün mirası olan yemek. Genellikle yuvarlak ve ince bir buğday hamuru tabanının üzerine domates, peynir ve isteğe bağlı diğer lezzetlerle hazırlanır. Bu eşsiz lezzeti denemeden geçmeyin", "hazirlamaZamani": "30 dk"],
      ["yildiz": "5", "aciklama": "Su, yaşamın temel kaynağıdır. Canlıların hayatta kalmaları ve doğanın dengesinin korunması için vazgeçilmez bir rol oynar.", "hazirlamaZamani": "0 dk"],
      ["yildiz": "4.9", "aciklama": "Sütlaç, süt, pirinç, vanilya ve tarçın gibi malzemelerin özenle bir araya getirilerek hazırlandığı, geleneksel bir tatlıdır. Pürüzsüz dokusu ve tatlı baharatlarla lezzetlendirilmiş tadı, damakları şımartır.", "hazirlamaZamani": "20 dk"],
      ["yildiz": "4.3", "aciklama": "Tiramisu, kahveli kedi dili bisküvileri ve krema ile hazırlanan, nefis bir İtalyan tatlısıdır. Katmanlar arasındaki kahve ve kakao tadı, tatlı krizlerini memnuniyetle sonlandırır.", "hazirlamaZamani": "10 dk"]
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    UNUserNotificationCenter.current().delegate = self
    
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge],completionHandler: { granted,error in
      
      self.izinKontrol = granted
      if granted{
        print("İzin alma işlemi başarılı")
      }else{
        print("İzin alma işlemi başarısız")
      }
    })
      
    viewModel.sepetiGuncelle(kullanici_adi: "Aleyna")
    _ = viewModel.yemekDetayListe.subscribe(onNext: { liste in
      self.yemekDetay = liste
    })
    
    if let resim = yemek{
      yemekAdiLabel.text   = resim.yemek_adi
      
      _ = viewModel.toplamUcret.subscribe(onNext: { ucret in
        self.ucretLabel.text = "\(ucret),00 ₺"
      })
      _ = viewModel.siparisMiktari.subscribe(onNext: { adet in
        self.AdetLabel.text = " Adet: \(adet)"
      })
      ucretLabel.text = " \(resim.yemek_fiyat!),00 ₺"
      
      if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resim.yemek_resim_adi!)")
      {
        DispatchQueue.main.async {
          self.yemekImageview.kf.setImage(with : url)
        }
      }
    }
  }
  
  @IBAction func buttonBildirimOlustur(_ sender: Any) {
    if izinKontrol{
      let icerik = UNMutableNotificationContent()
      icerik.title = "Sipariş Noktası"
      icerik.subtitle = "İndirim Fırsatı"
      icerik.body = "\(yemek?.yemek_adi ?? "Yemek Adı Belirtilmemiş") yanına ekstra yemekler yarı fiyatına.. "
      icerik.badge = 1
      icerik.sound = UNNotificationSound.default
      
      //      1 dk - 60sn sınırı var
      //      let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
      let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
      
      
      let istek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
      UNUserNotificationCenter.current().add(istek)
    }
  }
  
  @IBAction func siparisMiktariButton(_ sender: UIButton) {
    viewModel.adetHesapla(sender: sender)
    viewModel.toplamUcretiHesapla(ucret: Int((yemek?.yemek_fiyat)!)!)
  }
  
  @IBAction func vazgecButton(_ sender: Any) {
    dismiss(animated: true)
  }

  
  @IBAction func sepeteEkle(_ sender: Any) {
    viewModel.sepeteKontrolluEkleme(yemekDetay: yemekDetay, yemek: yemek, viewModel: viewModel)
    dismiss(animated: true)
  }
}

extension DetayVC : UNUserNotificationCenterDelegate{
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    
    completionHandler([.banner,.sound,.badge])
    
  }
  
}
