//
//  ProjectDetailView.swift
//  Due
//
//  Created by Josef Wengler on 20.07.22.
//

import SwiftUI

struct ProjectDetailView: View {
    let due: DueModel
    
    var body: some View {
        ZStack {
            Rectangle().ignoresSafeArea()
                .foregroundColor(due.theme.mainColor)
            
            VStack {
                
                VStack {
                    HStack {
                        Text("Due-Date: ")
                        Text(extraDate())
                        Spacer()
                        
                        // Gauge - ProgressView
                        ZStack {
                            Text("95%")
                                .fontWeight(.bold)
                                .padding()
                                .font(.largeTitle)
                                .background(
                                    GaugeProgressView())
                                .padding(.trailing)
                                .frame(width: 130, height: 130)
                                .offset(x: 35, y: -5)
                                .foregroundColor(Color.white)
                        }
                        .ignoresSafeArea()
                        
                    }
                    
                    InfoTextView(due: due)
                }
                .padding(.horizontal, 45)
                .offset(y: -80)
                
                Spacer()
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

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(due: DueModel.sampleData[0])
    }
}
