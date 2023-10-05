//
//  TaskDaoRepository.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import UIKit
import RxSwift


class TaskDaoRepository {
  
  var taskList = BehaviorSubject<[Task]>(value: [Task]())
  
  
  let db:FMDatabase?
  init(){
    let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDos.db")
    db = FMDatabase(path: veritabaniURL.path)
  }
  
  func save(task_name : String,task_title : String){
    db?.open()
    
    do{
        try db!.executeUpdate("INSERT INTO toDos (name,title) VALUES (?,?)", values: [task_name,task_title])
    }catch{
        print(error.localizedDescription)
    }
    
    db?.close()
  }
  
  func update(task_id:Int,task_name:String,task_title:String){
    db?.open()
    
    do{
        try db!.executeUpdate("UPDATE toDos SET name=?,title=? WHERE id=?", values: [task_name,task_title,task_id])
    }catch{
        print(error.localizedDescription)
    }
    
    db?.close()
  }
  
  func search(searchWord : String){
    db?.open()
    
    var list = [Task]()
    
    do{
        let rs = try db!.executeQuery("SELECT * FROM toDos WHERE name like '%\(searchWord)%'", values: nil)
        
        while rs.next() {
            let task_id  = Int(rs.string(forColumn: "id"))!
            let task_name  = rs.string(forColumn: "name")!
          let task_title = rs.string(forColumn: "title")!

          let task = Task(task_id: task_id, task_name: task_name,task_title: task_title)
            list.append(task)
        }
        
        taskList.onNext(list)
    }catch{
        print(error.localizedDescription)

    }
    db?.close()
  }
  
  func delete(task_id : Int){
    db?.open()
    
    do{
        try db!.executeUpdate("DELETE FROM toDos WHERE id=?", values: [task_id])
    }catch{
        print(error.localizedDescription)
    }
    
    db?.close()  }
  
  func taskInstall(){
    
    db?.open()
    
    var list = [Task]()

    do{
      let rs = try db! .executeQuery("SELECT * FROM toDos", values: nil)
      while rs.next(){
        let task_id = Int(rs.string(forColumn: "id"))!
        let task_name = rs.string(forColumn: "name")!
        let task_title = rs.string(forColumn: "title")!

        
        let task = Task(task_id: task_id, task_name: task_name, task_title : task_title)
        list.append(task)
      }
      taskList.onNext(list)

    }catch{
      print(error.localizedDescription)
    }
    db?.close()
  }
  
  
  func copyDatabase(){
    let bundleYolu = Bundle.main.path(forResource: "toDos", ofType: ".db")
    let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDos.db")
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: kopyalanacakYer.path){
      print("Veritabanı zaten var")
    }else{
      do{
        try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
      }catch{}
    }
  }
  
}
