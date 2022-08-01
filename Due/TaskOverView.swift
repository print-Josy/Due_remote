//
//  TaskOverView.swift
//  Due
//
//  Created by Josef Wengler on 23.07.22.
//

import SwiftUI

struct TaskOverView: View {
    let due: [DueModel]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
// VSTACK
            VStack() {
                ForEach(due) { due in
                    ForEach(due.tasks!) { task in
                        NavigationLink(destination: DueDetailView(due: due)) {
                            SliderTaskView(due: due, tasks: task)
                        }
                    }
                    .background(due.theme.mainColor)
                    .clipShape(Capsule())
                }
                Spacer()
                ControlBarView()
            }
            .navigationTitle("All Tasks") // invisible cause .black
           
//END VSTACK
            
            
        }
    }
}

struct TaskOverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskOverView(due: DueModel.sampleData)
                
        }
            
    }
}
