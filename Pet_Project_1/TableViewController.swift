//
//  TableViewController.swift
//  Pet_Project_1
//
//  Created by Елизавета Медведева on 04.03.2023.
//

import UIKit

class TableViewController: UITableViewController {

    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.tableView.reloadData()
        } //Выполнение прозрачности через 0.2 секунды после срабатывания анимации
    } //Кнопка редактирования
    
    @IBAction func pushAddAction(_ sender: Any) {
        let alertControler = UIAlertController(title: "Create new list", message: nil, preferredStyle: .alert) //Всплывающее окно для добавления записей
        
        alertControler.addTextField { (textField) in textField.placeholder = "New list name"
        } //Окно текста
        
        let alertAction1 = UIAlertAction(title: "Cancel", style: .default) { (alert) in
        } //Кнопка закрытия окна
        
        let alertAction2 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
            let newList = alertControler.textFields![0].text
            if newList != "" {
                addList(nameList: newList!)
                self.tableView.reloadData()
            }
        }//Кнопка добавления новой записи
        
        
        alertControler.addAction(alertAction1)
        alertControler.addAction(alertAction2)
        present(alertControler, animated: true, completion: nil)
    } //Вызов кнопки
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() //Скрытие лишних полей
        tableView.backgroundColor = UIColor.systemGroupedBackground //Изменение цвета пустых полей

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //let doneImage = UIImageView(image: UIImage(named: "done")!)

        
        let currentList = ToDoList[indexPath.row]
        cell.textLabel?.text = currentList["Name"] as? String
        
        if (currentList["isComplited"] as? Bool) == true {
            cell.imageView?.image = UIImage(named: "done")
        } else {
            cell.imageView?.image = UIImage(named: "notdone")
        } //Постановка галочки у выполненного списка дел (через картинку)
        
        
        if tableView.isEditing {
            cell.textLabel?.alpha = 0.3
            cell.imageView?.alpha = 0.3
        } else {
            cell.textLabel?.alpha = 1
            cell.imageView?.alpha = 1
        } //Выставление прозрачности задач в режиме редактирования

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeList(at: indexPath.row) //Удаление по индексу
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if changeState(at: indexPath.row) {
            
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "done")
        } else {
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "notdone")
        }
    } //Обработка выбора галочки у списка дел

    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveList(fromIndex: fromIndexPath.row, toIndex: to.row)
        
        tableView.reloadData()
    } //Метод для изменения индексов строк
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return .none
        } else {
            return .delete
        }
    } //Убирает минус слева в режиме редактирования
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    } //Перестает смещать ячйеку

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
