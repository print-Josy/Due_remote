//
//  SliderView.swift
//  Due
//
//  Created by Josef Wengler on 17.07.22.
//

import SwiftUI

struct SliderCalendarView: View {
    let due: DueModel
    var body: some View {
        VStack {
            HStack {
                if (due.tasks![0].task_time == nil) {
                    Text("all day")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                }
                else {
                    Text(extraDate())
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                }
                    
                
                VStack(alignment: .leading) {
                    Text(due.tasks![0].title)
                        .font(.caption)
                        .fontWeight(.semibold)
                    
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
    
    // extracting date: hour : minute
    func extraDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let date = formatter.string(from: due.tasks![0].task_date)
        return date
    }
    
    
}

struct SliderCalendarView_Previews: PreviewProvider {
    static var due = DueModel.sampleData[0]
    static var previews: some View {
        SliderCalendarView(due: due)
            .padding(.horizontal)

            .background(due.theme.mainColor)
            .clipShape(Capsule())
            .previewLayout(.fixed(width: 384.0, height: 60))
            
    }
}
