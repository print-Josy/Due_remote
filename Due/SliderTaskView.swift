//
//  SliderTaskView.swift
//  Due
//
//  Created by Josef Wengler on 24.07.22.
//

import SwiftUI

struct SliderTaskView: View {
    let due: DueModel
    let tasks: TaskModel

    var body: some View {
        VStack {
            HStack {
                Text(extraDate())
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .accessibilityLabel("date of the task")
                VStack(alignment: .leading) {
                    Text(due.tasks![0].title)
                        //.font(.custom("Poppins-SemiBold", size: 12))
                        .fontWeight(.semibold)
                        .accessibilityAddTraits(.isHeader)
                    
                    Text("Gesamtes Projekt anzeigen")
                        .font(.caption)
                }
                .fixedSize(horizontal: true, vertical: false)
                .accessibilityAddTraits(.isHeader)
                
                Spacer()
            }
            .frame(height: 70)
            
            //.accessibilityElement()

                
        }
        .foregroundColor(due.theme.accentColor)
        
    }
    
    // extracting date: day. month.
    func extraDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM."
        
        let date = formatter.string(from: due.tasks![0].task_date)
        return date
    }
    
}

struct SliderTaskView_Previews: PreviewProvider {
    static var due = DueModel.sampleData[0]
    static var previews: some View {
        SliderTaskView(due: due, tasks: due.tasks![0])
            .padding(.horizontal)
            .background(due.theme.mainColor)
            .clipShape(Capsule())
            .previewLayout(.fixed(width: 384.0, height: 60))
    }
}
