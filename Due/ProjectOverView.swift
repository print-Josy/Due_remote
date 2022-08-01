//
//  CalendarView.swift
//  Due
//
//  Created by Admin on 01.08.22.
//

import SwiftUI

struct ProjectOverView: View {
    let due: [DueModel]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Section {
                    ForEach(due) { due in
                        NavigationLink(destination: ProjectDetailView(due: due)) {
                            ProjectItemView(due: due)
                                .accentColor(due.theme.accentColor)
                        }
                    }
                }
                Spacer()
                
                ControlBarView()
                
            }
        }
        
    }
}

struct ProjectOverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectOverView(due: DueModel.sampleData)
        }
    }
}
