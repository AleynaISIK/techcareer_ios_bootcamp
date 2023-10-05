//
//  TaskDetailViewModel.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import Foundation

class TaskDetailViewModel{
  
  var krepo = TaskDaoRepository()
  
  func update(task_id:Int,task_name:String,task_title:String){
    krepo.update(task_id: task_id, task_name: task_name, task_title: task_title)
  }
}
