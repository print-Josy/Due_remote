//
//  DueModel.swift
//  Due
//
//  Created by Josef Wengler on 17.07.22.
//

import Foundation
import SwiftUI

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
    var task_date: Date
    var task_time: Date?
    
    init(id: UUID = UUID(), title: String, project: DueModel?=nil, task_time: Date?=nil, task_date: Date) {
        self.id = id
        self.title = title
        self.project = project
        self.task_date = task_date
        self.task_time = task_time
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
    
    struct Data {
        var title: String = ""
//        var project: DueModel?
        var type: String?
//        var task_date: Date = Date()
//        var task_time: Date?
        var attendees: [Attendee]? = []
//        var priority: Bool = false
//        var addInfo: String?
    }
    
    var data: Data {
        Data(title: title, attendees: attendees)
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
                tasks: [
                    TaskModel(title: "3D Design Task", task_time: getSampleTime(hour: 12, minute: 50), task_date: getSampleDate(offset: 5)),
                    TaskModel(title: "3D Papers", task_date: getSampleDate(offset: 12))
                ],
                due_date: getSampleDate(offset: 33),
                theme: .yellow),
        
        DueModel(
                title: "Operating Systems",
                attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                tasks: [
                    TaskModel(title: "Write in C", task_date: getSampleDate(offset: 35)),
                    TaskModel(title: "Love SEG-Fault",  task_date: getSampleDate(offset: 39)),
                    TaskModel(title: "TeamWork",  task_date: getSampleDate(offset: 44))
                ],
                due_date: getSampleDate(offset: 50),
                theme: .blue),
        
        DueModel(title: "OOP 2", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla"],
                 tasks: [
                    TaskModel(title: "Write in JAVA", task_date: getSampleDate(offset: 66))
                 ],
                 due_date: getSampleDate(offset: 90),
                 theme: .red)
    ]
}



// JOSEF PLEASE CHECK DU MAL DES MIT DE FONTS AUS, IDGI

// Links mit erklärungen:
// https://www.youtube.com/watch?v=l5QOsnNpiOw&ab_channel=Let%27sFinishthisAPP-KotlinandSwiftTutorials
// https://www.youtube.com/watch?v=AL_2ZgtF4Vk&ab_channel=KtrKathir
// https://sarunw.com/posts/scaling-custom-fonts-automatically-with-dynamic-type/

// des geht:
//.font(.custom("Poppins-SemiBold", size: 12))

// des geht ned:

//let customFonts: [UIFont.TextStyle: UIFont] = [
//    .largeTitle: UIFont(name: "Poppins-Light", size: 34)!,
//    .title1: UIFont(name: "Poppins-Light", size: 28)!,
//    .title2: UIFont(name: "Poppins-Light", size: 22)!,
//    .title3: UIFont(name: "Poppins-Light", size: 20)!,
//    .headline: UIFont(name: "Poppins-SemiBold", size: 17)!,
//    .body: UIFont(name: "Poppins-Light", size: 17)!,
//    .callout: UIFont(name: "Poppins-Light", size: 16)!,
//    .subheadline: UIFont(name: "Poppins-Light", size: 15)!,
//    .footnote: UIFont(name: "Poppins-Light", size: 13)!,
//    .caption1: UIFont(name: "Poppins-Light", size: 12)!,
//    .caption2: UIFont(name: "Poppins-Light", size: 11)!
//]
//
//extension UIFont {
//    class func customFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
//        let customFont = customFonts[style]!
//        let metrics = UIFontMetrics(forTextStyle: style)
//        let scaledFont = metrics.scaledFont(for: customFont)
//
//        return scaledFont
//    }
//}
//
//func fontReplacer() -> {
//    let styles: [UIFont.TextStyle] = [.largeTitle, .title1, .title2, .title3, .headline, .subheadline, .body, .callout, .footnote, .caption1, .caption2]
//    for style in styles {
//        let label = UILabel()
//        label.adjustsFontForContentSizeCategory = true
//        label.text = String(describing: style)
//        label.font = UIFont.customFont(forTextStyle: style)
//    }
//}
