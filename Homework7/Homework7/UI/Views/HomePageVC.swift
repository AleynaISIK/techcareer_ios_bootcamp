//
//  ViewController.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import UIKit

class HomePageVC: UIViewController {
  
  var viewModel = HomePageViewModel()
  
  @IBOutlet weak var taskTableView: UITableView!
  
  @IBOutlet weak var searchBar: UISearchBar!
  var taskList = [Task]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    searchBar.delegate = self //Anasayfa > UISearchBarDelegate
    
    taskTableView.delegate = self
    taskTableView.dataSource = self
    taskTableView.backgroundColor = .clear
    
    //    Navigation Controller Ayarları
    let appereance = UINavigationBarAppearance()
    appereance.backgroundColor =  UIColor.init(named: "#B2BAA0")
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.standardAppearance = appereance
    navigationController?.navigationBar.compactAppearance = appereance
    navigationController?.navigationBar.scrollEdgeAppearance = appereance
    
    
    //    Tabbar Controller Ayarları
    if let tabItems = tabBarController?.tabBar.items{
      
    }
    
    let appearance = UITabBarAppearance()
    appearance.backgroundColor = UIColor.init(named: "#B2BAA0")
    
    renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
    renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
    renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
    
    tabBarController?.tabBar.standardAppearance = appearance
    tabBarController?.tabBar.scrollEdgeAppearance = appearance
    tabBarController?.tabBar.barStyle = .black
    
    _ = viewModel.taskList.subscribe(onNext: { list in
      self.taskList = list
      self.taskTableView.reloadData()
    })
  }
  
  override func viewWillAppear(_ animated: Bool) {
    viewModel.taskInstall()
    
    print("Anasayfaya dönüldü")
    taskTableView.reloadData()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "HomePageVC_to_TaskDetailVC" {
      if let task = sender as? Task{
        let gidilecekVC = segue.destination as! TaskDetailVC
        gidilecekVC.task = task
      }
    }
  }
}

extension HomePageVC{
  
  func renkDegistir(itemAppearance : UITabBarItemAppearance){
    //    Seçili durum
    itemAppearance.selected.iconColor = UIColor.black
    itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
    
    //    Seçili olmayan durum
    itemAppearance.normal.iconColor = UIColor.gray
    itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]    
  }
}

extension HomePageVC : UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { //delegati ekle text did change yaz.
    viewModel.search(searchWord: searchText)
    print("Kişi Ara : \(searchText)")
  }
}

extension HomePageVC : UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return taskList.count //3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 0,1,2
    let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
    
    let task = taskList[indexPath.row]
    
    cell.labelTaskName.text = task.task_name
    cell.selectionStyle = .none
    cell.backgroundColor = .clear
    cell.backgroundViewOutlet.layer.cornerRadius = 12
    //    cell.backgroundViewOutlet.backgroundColor = UIColor(named: "#F9D4B7")
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let task = taskList[indexPath.row]
    print(task.task_name!)
    performSegue(withIdentifier: "HomePageVC_to_TaskDetailVC", sender: task)
    taskTableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { //trailing yazınca çıkıyor.
    let silAction = UIContextualAction(style: .destructive, title: "Sil"){
      contextualAction,view,bool in
      let task = self.taskList[indexPath.row]
      
      let alert = UIAlertController(title: "Silme İşlemi", message: "\(task.task_name!) silinsin mi?", preferredStyle: .alert)
      let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
      alert.addAction(iptalAction)
      let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
        self.viewModel.delete(task_id: task.task_id!)
        
      }
      
      alert.addAction(evetAction)
      
      self.present(alert,animated: true)
    }
    return UISwipeActionsConfiguration(actions: [silAction])
  }
}
