//
//  ContentView.swift
//  Due
//
//  Created by Josef Wengler on 17.07.22.
//

import SwiftUI

struct DueDetailView: View {
    let due: DueModel
    
    @State private var done = true
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
            
                VStack(alignment: .leading) {
                    
                    
                    Section() {
                        HStack {
                            Text("Projekt:      ")
                            NavigationLink(destination: ProjectDetailView(due: due)) {
                                Text(due.title)
                                    .underline()
                            }
                        }
                        .padding(.bottom, 1)
                        .accessibilityElement(children: .combine)
                        
                        HStack {
                            Text("Due-Date: ")
                            Text(extraDate())
                        }
                        .padding(.bottom, 30)
                        .accessibilityElement(children: .combine)
                        
                    }
                    
                    InfoTextView(due: due)
                        .foregroundColor(due.theme.mainColor)

                    Toggle(isOn: $done) {
                        Text("Task erledigt")
                    }
                        .toggleStyle(SwitchToggleStyle(tint: due.theme.mainColor))
                        .padding(.top)

                    Section(header: Text("Attendees")) {
                        ForEach(due.attendees) { attendee in
                            Label(attendee.name, systemImage: "person")
                        }
                        .font(.caption)
                    }
                    
                    
                    
                    Spacer()
                }
                .padding(.horizontal, 45.0)
                .foregroundColor(Color.white)
                
                
                ControlBarView()
            }
        }
    }
    
    // extracting date: day. month.
    func extraDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM."
        
        let date = formatter.string(from: due.due_date)
        return date
    }
    
}

struct DueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DueDetailView(due: DueModel.sampleData[0])
            
        }
    }
}
        
