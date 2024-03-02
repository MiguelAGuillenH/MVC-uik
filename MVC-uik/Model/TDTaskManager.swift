//
//  TDTaskManager.swift
//  MVC-uik
//
//  Created by DISMOV on 01/03/24.
//

import Foundation

class TDTaskManager {
    
    private var tdTask : [TDTask] = []
    
    var dataTasks = [
        TDTask(title: "Pasear al Perro", description: "Sacar al perro al parque a las 13 horas", isCompleted: false),
        TDTask(title: "Comprar chocolates a mi novia", description: "Le gustan los Ferreo de avellana", isCompleted: true),
        TDTask(title: "Cancelar Spotify Premium", description: "Cancelar antes del día 1 de marzo", isCompleted: false)
    ]
    
    func fetchTDTask(){
        tdTask = dataTasks
    }
    
    func countTDTask() -> Int{
        return tdTask.count
    }
    
    func getTDTask(at index : Int) -> TDTask {
        return tdTask[index]
    }
    
    func updateTaskCompletion(at index : Int) {
        tdTask[index].isCompleted.toggle()
        print(tdTask[index].title,tdTask[index].isCompleted)
    }
    
}
