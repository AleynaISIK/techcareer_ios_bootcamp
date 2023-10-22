//
//  HomePageVC.swift
//  SiparisNoktasi2
//
//  Created by Aleyna IŞIK on 07.10.2023.
//

import UIKit
import RxSwift
import Kingfisher

class AnasayfaVC: UIViewController {
  
  var yemeklerListesi   = [Yemekler]()
  var yemekDetay        = [YemekDetay]()
  var viewModel         = AnasayfaViewModel()
  
  var timer:Timer?
  var currentcellIndex = 0

  var webSeriesImages = [ "et_slider","tatli_slider","hamburger_slider", "icecek_slider"]
  
  @IBOutlet weak var kategoriKontrol : UISegmentedControl!
  @IBOutlet weak var searchBar       : UISearchBar!
  
  @IBOutlet weak var yemekListesiCollectionView: UICollectionView!{
    didSet{
      yemekListesiCollectionView.delegate   = self
      yemekListesiCollectionView.dataSource = self
      yemekListesiCollectionView.backgroundColor = .none
    }
  }
  
  @IBOutlet weak var pageView: UIPageControl!
  @IBOutlet weak var sliderCollectionView: UICollectionView!

  override func viewWillAppear(_ animated: Bool) {
    viewModel.yemekleriYukle()
    kategoriKontrol.selectedSegmentIndex = 0
    
  }
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    searchBar.delegate = self
    
    timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    
    pageView.numberOfPages = webSeriesImages.count
    
    _ = viewModel.yemeklerListesi.subscribe(onNext: { liste in
      self.yemeklerListesi = liste
      DispatchQueue.main.async {
        self.yemekListesiCollectionView.reloadData()
      }
    })
    
    viewModel.sepetGuncelle(kullanici_adi: "Aleyna")
    _ = viewModel.yemekDetayListe.subscribe(onNext: { liste in
      self.yemekDetay = liste
    })
    
    let tasarim = UICollectionViewFlowLayout()
    tasarim.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    tasarim.minimumLineSpacing = 5 //dikey boşluk
    tasarim.minimumInteritemSpacing = 5 //yataydaki boşluk
    let ekranGenislik = UIScreen.main.bounds.width
    let itemGenislik = (ekranGenislik - 30) / 2
    tasarim.itemSize = CGSize(width: itemGenislik , height: 143)
    yemekListesiCollectionView.collectionViewLayout = tasarim
    
//    Tabbar
    let appearance = UITabBarAppearance()
    appearance.backgroundColor = UIColor.systemOrange
    renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
    renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
    renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
    tabBarController?.tabBar.standardAppearance = appearance
    tabBarController?.tabBar.scrollEdgeAppearance = appearance
  }
  
  func renkDegistir(itemAppearance : UITabBarItemAppearance){
//    Seçili durum
    itemAppearance.selected.iconColor = UIColor.white
    itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
    itemAppearance.selected.badgeBackgroundColor = UIColor.black
//    Seçili olmayan durum
    itemAppearance.normal.iconColor = UIColor.init(named: "FFC6AE")
    itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.init(named: "FFC6AE")]
    itemAppearance.normal.badgeBackgroundColor = UIColor.init(named: "FFC6AE")
  }
  
  @objc func slideToNext(){
    if currentcellIndex < webSeriesImages.count - 1{
      currentcellIndex = currentcellIndex + 1
    }else{
      currentcellIndex = 0
    }
    pageView.currentPage = currentcellIndex
    sliderCollectionView.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0), at: .right, animated: true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Anasayfa_to_Detay"{
      if let yemek = sender as? Yemekler{
        let gidilecekVC = segue.destination as! DetayVC
        gidilecekVC.yemek = yemek
      }
    }
  }
  
  
  @IBAction func kategoriKontrol(_ sender: UISegmentedControl) {
    let selectedIndex = sender.selectedSegmentIndex
    switch selectedIndex{
    case 0: viewModel.yemekleriYukle()
    case 1: viewModel.ketegori(idList: viewModel.yemekFiltre)
    case 2: viewModel.ketegori(idList: viewModel.tatliFiltre)
    case 3: viewModel.ketegori(idList: viewModel.icecekFiltre)
    default:
      break
    }
  }
}


extension AnasayfaVC : UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    viewModel.ara(aramaKelimesi: searchText)
  }
}

extension AnasayfaVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print(yemeklerListesi.count)
    if collectionView == yemekListesiCollectionView{
      return yemeklerListesi.count
    }else{
      return webSeriesImages.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == yemekListesiCollectionView {
      let cell = yemekListesiCollectionView.dequeueReusableCell(withReuseIdentifier: "yemekListesiCollectionViewCell", for: indexPath) as! yemekListesiCollectionViewCell
      
      let yemekler = yemeklerListesi[indexPath.row]
      cell.yemek_adi_label_outlet.text = "\(yemekler.yemek_adi!) "
      cell.yemek_fiyat_label_outlet.text = "\(yemekler.yemek_fiyat!).00 ₺"
      
      if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemekler.yemek_resim_adi!)")
      {
        DispatchQueue.main.async {
          cell.imageview_outlet.kf.setImage(with : url)
        }
      }
      return cell
    }else{
      let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "AnasayfaSliderCollectionViewCell", for: indexPath) as! AnasayfaSliderCollectionViewCell
      
      cell.imageView.image = UIImage(named: webSeriesImages[indexPath.row])
      return cell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let yemek = yemeklerListesi[indexPath.row]
    performSegue(withIdentifier: "Anasayfa_to_Detay", sender: yemek)
    print("Tıklandığı index : \(indexPath.row)")
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == sliderCollectionView{
      return CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
    }else{
     return CGSize(width: 188, height: 140)
    }
  }
  
}

