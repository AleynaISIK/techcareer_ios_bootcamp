//
//  AnasayfaViewModel.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel{
  
  var krepo = TaskDaoRepository()
  var taskList = BehaviorSubject<[Task]>(value: [Task]())
  
  init(){
    krepo.copyDatabase()
    taskList = krepo.taskList
  }
  
  func search(searchWord : String){
    krepo.search(searchWord: searchWord)
  }
  
  func delete(task_id : Int){
    krepo.delete(task_id: task_id)
    taskInstall() //sildiğimiz veriler gitmesi için güncelleme yapıyoruz.
  }
  
  func taskInstall(){
    krepo.taskInstall()
  }
}
