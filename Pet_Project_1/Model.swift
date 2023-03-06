//
//  Model.swift
//  Pet_Project_1
//
//  Created by Елизавета Медведева on 04.03.2023.
//

import Foundation

var ToDoList: [[String: Any]] = [["Name": "1", "isComplited": false], ["Name": "2", "isComplited": true]]

func addList(nameList: String, isComplited: Bool = false) {
    ToDoList.append(["Name": nameList, "isComplited": isComplited]) //Добавление нового элемента
    saveData()
}

func removeList(at index: Int) {
    ToDoList.remove(at: index) //Удаление элемента по индексу
    saveData()
}

func changeState (at list: Int) -> Bool {
    ToDoList[list]["isComplited"] = !(ToDoList[list]["isComplited"] as! Bool)
    saveData()
    return ToDoList[list]["isComplited"] as! Bool
} //Выбор галочки в списке дел 

func saveData() {
    print ("Save data!")
    
}

func loadData() {
    
}
