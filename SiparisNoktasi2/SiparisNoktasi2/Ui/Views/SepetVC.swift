//
//  SepetVC.swift
//  SiparisNoktasi2
//
//  Created by Aleyna IŞIK on 19.10.2023.
//

import UIKit
var siparisOnay = 0
var siparisOnayListesi = [Int]()
var siparisTarihi = [String]()

class SepetVC: UIViewController {

    
    @IBOutlet weak var baslıkLabel: UILabel!
    
    @IBOutlet weak var toplamLabel: UILabel!
    @IBOutlet weak var toplamTutarLabel: UILabel!
 
    @IBOutlet weak var sepetTableView: UITableView!
    
    var yemeklerDetay = [YemekDetay]()
    var sepetId = 0
    var kullanici_adi = "Aleyna"
    
    
  var viewModel = SepetViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        baslıkLabel.text = "Sepet"
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self

        toplamTutarLabel.text = "0 ₺"
              
        
    }
    override func viewWillAppear(_ animated: Bool) {
      viewModel.sepetiGetir(sepet_yemek_id: sepetId, kullanici_adi: kullanici_adi)
        
    }
 
    @IBAction func buttonSepetiOnayla(_ sender: Any) {
        siparisOnay += 1
        siparisOnayListesi.append(siparisOnay)
        let tarih = Date()
        let formatter = DateFormatter()
        formatter.string(from: tarih)
        formatter.dateFormat = "d MMM, HH:mm"
       
        let sipTarih = formatter.string(from: tarih)
        siparisTarihi.append(sipTarih)
        print(siparisTarihi)
        
        let alert = UIAlertController(title: "Sepet Onaylandı!", message: "Siparişiniz Hazırlanmaya Başladı.  Siparişlerim kısmından takip edebilirsiniz.", preferredStyle: .alert)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .default){action in
        }
        alert.addAction(tamamAction)
        self.present(alert, animated: true)
        if let tabItems = tabBarController?.tabBar.items{
                    let siparislerTabBarItem = tabItems[2]
                    siparislerTabBarItem.badgeValue = "\(siparisOnay)"
                }
    }

}
extension SepetVC{
    func viewVeriGonder(liste: Array<YemekDetay>) {
        self.yemeklerDetay = liste
      
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
            //Sepet boş ise yapılabilecekler
      
            var result = 0
            for urun in liste{
                let adet = Int(urun.yemek_siparis_adet!)!
                let fiyat = Int(urun.yemek_fiyat!)!
                let toplam = adet*fiyat
                result=result+toplam
                self.toplamTutarLabel.text = "\(result) ₺"
            }
        }
    }
    
    
}
extension SepetVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if yemeklerDetay.count == 0{
            toplamTutarLabel.text = "10 ₺"
            return yemeklerDetay.count
        }else{
            return yemeklerDetay.count
        }
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerDetay[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "SepetTableViewCell", for: indexPath) as! SepetTableViewCell
        
      print("buraya giriyor table")
        hucre.urunAdLabel.text = yemek.yemek_adi
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                hucre.urunImageView.kf.setImage(with: url)
                    }

        }
        var toplamtutar=0
        if let f=yemek.yemek_fiyat,let a=yemek.yemek_siparis_adet{
            let fiyat=Int(f)
            let adet=Int(a)
            toplamtutar=(fiyat!)*(adet!)
        }
        hucre.toplamTutarLabel.text = "\(toplamtutar) ₺"
        hucre.urunAdetLabel.text = yemek.yemek_siparis_adet
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let yemek = self.yemeklerDetay[indexPath.row]
            self.sepetId = (Int(yemek.sepet_yemek_id!)!)
            
            let alert = UIAlertController(title: "Ooopsss!", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){action in}
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
    
              self.viewModel.sil(sepet_yemek_id: (Int(yemek.sepet_yemek_id!)!), kullanici_adi: self.kullanici_adi)
            }
            
            
            
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
        
        
    }
    
    
}
