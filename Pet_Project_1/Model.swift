//
//  Model.swift
//  Pet_Project_1
//
//  Created by Елизавета Медведева on 04.03.2023.
//

import Foundation

var ToDoList: [String] = ["1", "2"]

func addList(nameList: String) {
    ToDoList.append(nameList) //Добавление нового элемента
    saveData()
}

func removeList(at index: Int) {
    ToDoList.remove(at: index) //Удаление элемента по индексу
    saveData()
}

func saveData() {
    
}

func loadData() {
    
}
