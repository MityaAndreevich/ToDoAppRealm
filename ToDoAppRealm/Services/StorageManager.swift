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
    
    func save(_ taskLists: [TaskList]) {
        try! realm.write {
            realm.add(taskLists)
        }
    }
}
