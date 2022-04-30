//
//  TaskList.swift
//  ToDoAppRealm
//
//  Created by Dmitry Logachev on 28.04.2022.
//

import RealmSwift

class TaskList: Object {
    @Persisted var name = ""
    @Persisted var date = Date()
    let tasks = List<Task>()
}

class Task: Object {
    @Persisted var name = ""
    @Persisted var note = ""
    @Persisted var date = Date()
    @Persisted var isCompleted = false
}
