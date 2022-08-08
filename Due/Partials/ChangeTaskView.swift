//
//  ChangeTaskView.swift
//  Due
//
//  Created by Admin on 04.08.22.
//

import SwiftUI

struct ChangeTaskView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    @State private var data = TaskModel.TaskData()
    
    var body: some View {
        ZStack {
            Color("darkgrey").ignoresSafeArea();
            
            Form {
                Section() {
                    
                    ZStack(alignment: .leading) {
                        if data.title.isEmpty {
                            Text("Task Titel*")
                                .foregroundColor(Color.white.opacity(0.3))
                        }
                        TextField("", text: $data.title)
                    }
                    
                    
                    HStack {
                        
                    }
                }
                .listRowBackground(Color("darkgrey"))
            }
            .foregroundColor(Color.white)
        }
    }
}
    


struct ChangeTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTaskView()
    }
}
