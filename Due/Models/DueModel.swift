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
    var due_date: Date
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], tasks: [TaskModel]?=nil, due_date: Date, theme: Theme) {
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
    var project: DueModel?
    var task_time: Date?
    var task_date: Date
    
    init(id: UUID = UUID(), title: String, project: DueModel?=nil, task_time: Date?=nil, task_date: Date) {
        self.id = id
        self.title = title
        self.project = project
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

func getSampleDate(offset: Int)->Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}
func getSampleTime(hour: Int, minute: Int)->Date {
    let calendar = Calendar.current
    let time = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: Date())
//    let time = calendar.date(byAdding: .hour, value: hour, to: Date())
    return time ?? Date()
}

extension DueModel {
    
    
    static let sampleData: [DueModel] =
    [
        DueModel(
                title: "3D Projekt",
                attendees: ["Tanja", "Josef", "Sarah", "Samuel"],
                tasks: [TaskModel(title: "3D Design Task", task_time: getSampleTime(hour: 12, minute: 50), task_date: getSampleDate(offset: 5)),
                        TaskModel(title: "3D Papers", task_date: getSampleDate(offset: 12))],
                due_date: getSampleDate(offset: 33),
                theme: .yellow),
        
        DueModel(
                title: "Operating Systems",
                attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                tasks: [TaskModel(title: "Write in C", task_date: getSampleDate(offset: 35)),
                        TaskModel(title: "Love SEG-Fault",  task_date: getSampleDate(offset: 39)),
                        TaskModel(title: "TeamWork",  task_date: getSampleDate(offset: 44))],
                due_date: getSampleDate(offset: 50),
                theme: .sky),
        
        DueModel(title: "OOP 2", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla"],
                 tasks: [TaskModel(title: "Write in JAVA", task_date: getSampleDate(offset: 66))],
                 due_date: getSampleDate(offset: 90),
                 theme: .poppy)
    ]
}
