//
//  ViewController.swift
//  MVC-uik
//
//  Created by DISMOV on 01/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tdTaskTableView: UITableView!
    let tdTaskManager = TDTaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tdTaskTableView.delegate = self
        tdTaskTableView.dataSource = self
        tdTaskManager.fetchTDTask()
    }
    
}

//MARK: Delegate and data source methods

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tdTaskManager.countTDTask()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TDTaskCell", for: indexPath) as! TDTaskTableViewCell
        let tdTask = tdTaskManager.getTDTask(at: indexPath.row)
        cell.tdTaskTitle.text = tdTask.title
        cell.accessoryType = tdTask.isCompleted ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tdTaskManager.updateTaskCompletion(at: indexPath.row)
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = tdTaskManager.getTDTask(at: indexPath.row).isCompleted ? .checkmark : .none
        cell?.selectionStyle = .none
        
    }
    
}

