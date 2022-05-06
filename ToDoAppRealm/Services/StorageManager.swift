//
//  StorageManager.swift
//  ToDoAppRealm
//
//  Created by Dmitry Logachev on 30.04.2022.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    let realm = try! Realm()
    
    private init() {}
    //MARK: - TaskList Methods
    func save(_ taskLists: [TaskList]) {
        write {
            realm.add(taskLists)
        }
    }
    
    func save(_ taskList: TaskList) {
        write {
            realm.add(taskList)
        }
    }
    
    func delete(_ taskList: TaskList) {
        write {
            realm.delete(taskList.tasks)
            realm.delete(taskList)
        }
    }
    
    func editTaskList(_ taskList: TaskList, newValue: String) {
        write {
            taskList.name = newValue
        }
    }
    
    func done(_ taskList: TaskList) {
        write {
            taskList.tasks.setValue(true, forKey: "isCompleted")
        }
    }
    
    //MARK: - Tasks Methods
    func save(_ task: Task, to taskList: TaskList) {
        write {
            taskList.tasks.append(task)
        }
    }
    
    func delete(_ task: Task) {
        write {
            realm.delete(task)
        }
    }
    
    func edit(_ task: Task, with newName: String, withNewNote note: String) {
        write {
            task.name = newName
            task.note = note
        }
    }
    
    func done(_ task: Task) {
        write {
            task.isCompleted.toggle()
        }
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error)
        }
    }
}
