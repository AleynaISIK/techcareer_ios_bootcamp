//
//  ViewController.swift
//  TabBarKullanimi
//
//  Created by Aleyna IŞIK on 17.09.2023.
//

import UIKit

class Anasayfa: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let tabItems = tabBarController?.tabBar.items{
      let anasayfaItem = tabItems[0]
      let ayarlarItem = tabItems[1]
      anasayfaItem.badgeValue = "3"
      ayarlarItem.badgeValue = "Update"
      
    }
    
    let appearance = UITabBarAppearance()
    appearance.backgroundColor = UIColor.systemCyan
    
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
    itemAppearance.selected.badgeBackgroundColor = UIColor.orange
//    Seçili olmayan durum
    itemAppearance.normal.iconColor = UIColor.systemGray
    itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
    itemAppearance.normal.badgeBackgroundColor = UIColor.gray
  }
}

