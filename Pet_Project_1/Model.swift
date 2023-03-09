//
//  Model.swift
//  Pet_Project_1
//
//  Created by Елизавета Медведева on 04.03.2023.
//

import Foundation

var ToDoList: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoData")
        UserDefaults.standard.synchronize()
    }
    
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoData")
            as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}
    
    func addList(nameList: String, isComplited: Bool = false) {
        ToDoList.append(["Name": nameList, "isComplited": isComplited]) //Добавление нового элемента, реализация через словарь
        //saveData()
    }
    
    func removeList(at index: Int) {
        ToDoList.remove(at: index) //Удаление элемента по индексу
        //saveData()
    }
    
    func moveList (fromIndex: Int, toIndex: Int) {
        let from = ToDoList[fromIndex]
        ToDoList.remove(at: fromIndex)
        ToDoList.insert(from, at: toIndex)
        
    } //Реализация метода изменения индексов строк

    func changeState (at list: Int) -> Bool {
        ToDoList[list]["isComplited"] = !(ToDoList[list]["isComplited"] as! Bool)
        //saveData()
        return ToDoList[list]["isComplited"] as! Bool
    } //Выбор галочки в списке дел
    
    /*
     
     func saveData() {
     UserDefaults.standard.set(ToDoList, forKey: "ToDoData")
     UserDefaults.standard.synchronize()
     print ("Save data!")
     } //Сохранение данных
     
     func loadData() {
     if let array = UserDefaults.standard.array(forKey: "ToDoData")
     as? [[String: Any]] {
     ToDoList = array
     } else {
     ToDoList = []
     }
     } //Загрузка данных
     
     */
    
