//
//  DueModel.swift
//  Due
//
//  Created by Josef Wengler on 17.07.22.
//

import Foundation

struct DueModel: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var tasks: [TaskModel]?
    var due_date: String
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], tasks: [TaskModel]?=nil, due_date: String, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.tasks = tasks
        self.due_date = due_date
        self.theme = theme
    }
}

struct TaskModel: Identifiable {
    let id: UUID
    var title: String
    var task_time: String?
    var task_date: String
    
    init(id: UUID = UUID(), title: String, task_time: String?=nil, task_date: String) {
        self.id = id
        self.title = title
        self.task_time = task_time
        self.task_date = task_date
    }
}

extension DueModel {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}



extension DueModel {
    static let sampleData: [DueModel] =
    [
        DueModel(title: "3D Projekt", attendees: ["Tanja", "Josef", "Sarah", "Samuel"],
                tasks: [TaskModel(title: "3D Design Task", task_time: "18:00", task_date: "29.03"),
                        TaskModel(title: "3D Papers", task_date: "16.04")], due_date: "20.04", theme: .yellow),
        
        DueModel(title: "Operating Systems", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                tasks: [TaskModel(title: "Write in C", task_date: "03.04"),
                        TaskModel(title: "Love SEG-Fault",  task_date: "22.04"),
                        TaskModel(title: "TeamWork",  task_date: "02.05")], due_date: "21.05", theme: .sky),
        
        DueModel(title: "OOP 2", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla"],
                 tasks: [TaskModel(title: "Write in JAVA", task_date: "06.04")], due_date: "12.04", theme: .poppy)
    ]
}
