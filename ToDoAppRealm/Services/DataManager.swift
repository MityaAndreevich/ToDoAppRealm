//
//  DataManager.swift
//  ToDoAppRealm
//
//  Created by Dmitry Logachev on 28.04.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempData(_ completion: @escaping() -> Void) {
        if !UserDefaults.standard.bool(forKey: "done") {
            UserDefaults.standard.set(true, forKey: "done")
            
            let moviesList = TaskList(value:
                                        ["Movies List", Date(),
                                              [
                                                ["Best Film Ever"],
                                                ["Second best film ever", "Must see", Date(), true]
                                              ]
                                        ])
            
            let shoppingList = TaskList()
            shoppingList.name = "Shopping List"
            let milk = Task()
            milk.name = "Milk"
            milk.note = "2L"
            
            let bread = Task(value: ["Bread", "", Date(), true])
            
            let apples = Task(value: ["name": "Apples", "note": "2kg"])
            
            shoppingList.tasks.append(milk)
            shoppingList.tasks.insert(contentsOf: [bread, apples], at: 1)
        }
    }
}
