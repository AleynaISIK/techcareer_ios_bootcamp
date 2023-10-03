//
//  AddTaskViewModel.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import Foundation

class AddTaskViewModel{
  
  var krepo = TaskDaoRepository()
  
  func save(task_name:String){
    krepo.save(task_name:task_name)
  }
  
}
