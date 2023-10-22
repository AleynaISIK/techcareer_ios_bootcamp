//
//  KarsilamaVC.swift
//  SiparisNoktasiUygulamasi
//
//  Created by Aleyna IŞIK on 22.10.2023.
//

import UIKit

class KarsilamaVC: UIViewController {
  
  @IBOutlet weak var pageView: UIPageControl!
  @IBOutlet weak var sliderCollectionView: UICollectionView!
  
  var timer:Timer?
  var currentcellIndex = 0
  
  var webSeriesImages = [ "karsilama1","karsilama2","karsilama3"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
    
    pageView.numberOfPages = webSeriesImages.count
  }
  
  @objc func slideToNext(){
    if currentcellIndex < webSeriesImages.count - 1{
      currentcellIndex = currentcellIndex + 1
    }else{
      performSegue(withIdentifier: "karsilama_to_anasayfa", sender: nil)
    }
    pageView.currentPage = currentcellIndex
    sliderCollectionView.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0), at: .right, animated: true)
  }
  
}

extension KarsilamaVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return webSeriesImages.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "AnasayfaSliderCollectionViewCell", for: indexPath) as! AnasayfaSliderCollectionViewCell
    
    cell.imageView.image = UIImage(named: webSeriesImages[indexPath.row])
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
    
  }
  
}

