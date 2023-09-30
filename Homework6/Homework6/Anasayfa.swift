//
//  ViewController.swift
//  Homework6
//
//  Created by Aleyna IŞIK on 29.09.2023.
//

import UIKit

class Anasayfa: UIViewController {
  
  @IBOutlet weak var arama_view_outlet: UIView!
  
  var kitaplarListesi = [Kitaplar]()
  var kirtasiyeMalzemeleri = [Kirtasiye]()
  var teknolojiUrunleri = [Teknoloji]()
  var populerUrunler = [PopulerUrunler]()

  @IBOutlet weak var oneCikanKitaplarCollectionView: UICollectionView!{
    didSet{
      oneCikanKitaplarCollectionView.dataSource = self
      oneCikanKitaplarCollectionView.delegate = self
    }
  }
  
  @IBOutlet weak var kirtasiyeMalzemeleriCollectionView: UICollectionView!{
    didSet{
      kirtasiyeMalzemeleriCollectionView.dataSource = self
      kirtasiyeMalzemeleriCollectionView.delegate = self
      kirtasiyeMalzemeleriCollectionView.backgroundColor = .clear
    }
  }
  
  @IBOutlet weak var teknolojiCollectionView: UICollectionView!{
    didSet{
      teknolojiCollectionView.dataSource = self
      teknolojiCollectionView.delegate = self
    }
  }
  
  @IBOutlet weak var populerUrunlerCollectionView: UICollectionView!{
    didSet{
      populerUrunlerCollectionView.dataSource = self
      populerUrunlerCollectionView.delegate = self
      populerUrunlerCollectionView.backgroundColor = .clear
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addNavBarImages()
    
    let f1 = Kitaplar(id: 1, kitap_ad: "Sapiens", yazar_ad: "Yuval Noah Harari", resim: "kitap3")
    let f2 = Kitaplar(id: 2, kitap_ad: "Diriliş", yazar_ad: "Tess Gerritsen", resim: "kitap4")
    let f3 = Kitaplar(id: 3, kitap_ad: "Peri Masalı", yazar_ad: "Stephan King", resim: "kitap1")
    let f4 = Kitaplar(id: 4, kitap_ad: "", yazar_ad: "The Hateful Eight", resim: "kitap2")
    kitaplarListesi.append(f1)
    kitaplarListesi.append(f2)
    kitaplarListesi.append(f3)
    kitaplarListesi.append(f4)
    
    let m1 = Kirtasiye(id: 1, kirtasiye_malzemesi_ad: "Faber-Castell 5068113000 Eğlenceli Keçeli Kalem 30 lu", kirtasiye_malzemesi_resim: "kirtasiye2")
    let m2 = Kirtasiye(id: 2, kirtasiye_malzemesi_ad: "Akademi Çocuk Mini Set Travel Set Funny Mat", kirtasiye_malzemesi_resim: "kirtasiye4")
    let m3 = Kirtasiye(id: 3, kirtasiye_malzemesi_ad: "Sharpie Snote Kesik Uç 12'li Karışık Krearif Markör", kirtasiye_malzemesi_resim: "kirtasiye3")
    let m4 = Kirtasiye(id: 4, kirtasiye_malzemesi_ad: "Scrikss Smoothie Jel Kalem 8 Li Blister", kirtasiye_malzemesi_resim: "kirtasiye1")
    kirtasiyeMalzemeleri.append(m1)
    kirtasiyeMalzemeleri.append(m2)
    kirtasiyeMalzemeleri.append(m3)
    kirtasiyeMalzemeleri.append(m4)
    
    let t1 = Teknoloji(id: 1, teknoloji_urun_ad: "İphone 13 128GB Yeşil Cep Telefonu", teknoloji_urun_resim: "teknoloji1")
    let t2 = Teknoloji(id: 2, teknoloji_urun_ad: "Apple Airpods 3.Nesil Kulak İçi Bluetooth Kulaklık ve Magsafe Şarj Kutusu", teknoloji_urun_resim: "teknoloji2")
    let t3 = Teknoloji(id: 3, teknoloji_urun_ad: "Xiomi Mi Smart Akıllı Ses Kontrollü Otomatik Mama Kabı", teknoloji_urun_resim: "teknoloji3")
    let t4 = Teknoloji(id: 4, teknoloji_urun_ad: "JBL Tune 560Bt Wireless Kulaklık", teknoloji_urun_resim: "teknoloji4")
    teknolojiUrunleri.append(t1)
    teknolojiUrunleri.append(t2)
    teknolojiUrunleri.append(t3)
    teknolojiUrunleri.append(t4)
    
    let p1 = PopulerUrunler(id: 1, populer_urun_ad: "Atatürk'ün Sevdiği Şarkılar", populer_urun_resim: "populer3")
    let p2 = PopulerUrunler(id: 2, populer_urun_ad: "Star Wars F119 Animatronic Baby Yoda Figür", populer_urun_resim: "populer1")
    let p3 = PopulerUrunler(id: 3, populer_urun_ad: "Zeki Müren Klasikler", populer_urun_resim: "populer2")
    let p4 = PopulerUrunler(id: 4, populer_urun_ad: "Apple İphone 13 128GB Cep Telefonu", populer_urun_resim: "populer4")
    populerUrunler.append(p1)
    populerUrunler.append(p2)
    populerUrunler.append(p3)
    populerUrunler.append(p4)
    
    arama_view_outlet.layer.borderColor = UIColor(red: 222, green: 222, blue: 222, alpha: 1).cgColor
    arama_view_outlet.layer.borderWidth = 2
    
    //    Navigation Controller Ayarları
    let appereance = UINavigationBarAppearance()
    appereance.backgroundColor = UIColor.white
    navigationController?.navigationBar.barStyle = .black
    
    navigationController?.navigationBar.standardAppearance = appereance
    navigationController?.navigationBar.compactAppearance = appereance
    navigationController?.navigationBar.scrollEdgeAppearance = appereance
    
    
    //    Tabbar Controller Ayarları
    if let tabItems = tabBarController?.tabBar.items{
            let anasayfaItem = tabItems[0]
            let kategorilerItem = tabItems[1]
            let kesfetItem = tabItems[2]
            let sepetimItem = tabItems[3]
      
    }
    
    let appearance = UITabBarAppearance()
    appearance.backgroundColor = UIColor.white
    
    renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
    renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
    renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
    
    
    tabBarController?.tabBar.standardAppearance = appearance
    tabBarController?.tabBar.scrollEdgeAppearance = appearance
    tabBarController?.tabBar.barStyle = .black
    
  }
  
  func renkDegistir(itemAppearance : UITabBarItemAppearance){
    //    Seçili durum
    itemAppearance.selected.iconColor = UIColor.blue
    itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.blue]
    
    
    //    Seçili olmayan durum
    itemAppearance.normal.iconColor = UIColor.systemGray
    itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
  }
}

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == oneCikanKitaplarCollectionView {
      return CGSize( width: 135, height: 270)
    }else if collectionView == kirtasiyeMalzemeleriCollectionView {
      return CGSize( width: 135, height: 270)
      
    }else if collectionView == teknolojiCollectionView {
      return CGSize( width: 135, height: 270)
      
    }else if collectionView == populerUrunlerCollectionView {
      return CGSize( width: 135, height: 270)
      
    }
    return CGSize(width: 180 , height: 235)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("burda")
    if collectionView == oneCikanKitaplarCollectionView {
      return kitaplarListesi.count
    }else if  collectionView == kirtasiyeMalzemeleriCollectionView{
      return kirtasiyeMalzemeleri.count
    }else if  collectionView == teknolojiCollectionView{
      return teknolojiUrunleri.count
    }else if  collectionView == populerUrunlerCollectionView{
      return populerUrunler.count
    }
    return kitaplarListesi.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == oneCikanKitaplarCollectionView {
      
      let cell = oneCikanKitaplarCollectionView.dequeueReusableCell(withReuseIdentifier: "OneCikanKitaplarCVC", for: indexPath) as! OneCikanKitaplarCVC
      
      let kitap = kitaplarListesi[indexPath.row]
      
      cell.imageview_outlet.image = UIImage(named: kitap.kitap_resim!)
      cell.kitap_adi_label_outlet.text = "\(kitap.kitap_ad!) "
      cell.kitap_yazari_label_outlet.text = "\(kitap.yazar_ad!) "
      cell.contentView.backgroundColor = .clear
      
      return cell
      
    }else if collectionView == kirtasiyeMalzemeleriCollectionView {
      
      let cell = kirtasiyeMalzemeleriCollectionView.dequeueReusableCell(withReuseIdentifier: "kirtasiyeMalzemeleriCVC", for: indexPath) as! kirtasiyeMalzemeleriCVC
      
      
      let kirtasiye = kirtasiyeMalzemeleri[indexPath.row]
      cell.imageview_outlet.image = UIImage(named: kirtasiye.kirtasiye_malzemesi_resim!)
      cell.kirtasiye_malzemesi_ad.text = "\(kirtasiye.kirtasiye_malzemesi_ad!) "
      cell.contentView.backgroundColor = .clear
      
      return cell
      
    }else if collectionView == teknolojiCollectionView {
      
      let cell = teknolojiCollectionView.dequeueReusableCell(withReuseIdentifier: "TeknolojiCVC", for: indexPath) as! TeknolojiCVC
      
      let teknoloji = teknolojiUrunleri[indexPath.row]
      cell.imageview_outlet.image = UIImage(named: teknoloji.teknoloji_urun_resim!)
      cell.teknoloji_ad.text = "\(teknoloji.teknoloji_urun_ad!) "
      cell.contentView.backgroundColor = .clear
      
      return cell
      
    }else if collectionView == populerUrunlerCollectionView {
      
      let cell = populerUrunlerCollectionView.dequeueReusableCell(withReuseIdentifier: "PopulerUrunCVC", for: indexPath) as! PopulerUrunCVC
      
      let populerUrun = populerUrunler[indexPath.row]
      cell.imageview_outlet.image = UIImage(named: populerUrun.populer_urun_resim!)
      cell.populer_urun_ad.text = "\(populerUrun.populer_urun_ad!) "
      cell.contentView.backgroundColor = .clear
      
      return cell
      
    }else{
      let cell = oneCikanKitaplarCollectionView.dequeueReusableCell(withReuseIdentifier: "OneCikanKitaplarCVC", for: indexPath) as! OneCikanKitaplarCVC
      
      return cell
      
    }
  }
}

extension Anasayfa {
    func addNavBarImages() {
      
        let navController = navigationController!
                     
             // Sol tarafındaki resim
             let leftImage = UIImage(named: "menu") // Sol taraftaki resmin adını buraya ekleyin
             let imageWidth: CGFloat = 30.0 // Genişlik (width) değerini ayarlayın
             let imageHeight: CGFloat = 30.0 // Yükseklik (height) değerini ayarlayın
             
             // Resmi boyutlandır
             let scaledLeftImage = leftImage?.resize(targetSize: CGSize(width: imageWidth, height: imageHeight))
             
             let leftImageView = UIImageView(image: scaledLeftImage)
             leftImageView.contentMode = .scaleAspectFit
             let leftBarButton = UIBarButtonItem(customView: leftImageView)
             navigationItem.leftBarButtonItem = leftBarButton
             
             // Orta kısımdaki logo
             let logoImage = UIImage(named: "logo") // Logo resminizin adını buraya ekleyin
             let logoWidth: CGFloat = 100.0 // Genişlik (width) değerini ayarlayın
             let logoHeight: CGFloat = 50.0 // Yükseklik (height) değerini ayarlayın
             
             // Logo boyutlandır
             let scaledLogoImage = logoImage?.resize(targetSize: CGSize(width: logoWidth, height: logoHeight))
             
             let imageView = UIImageView(image: scaledLogoImage)
             imageView.contentMode = .scaleAspectFit
             navigationItem.titleView = imageView
         }
}
extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ? CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
