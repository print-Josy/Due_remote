//
//  NavigationView.swift
//  Due
//
//  Created by Josef Wengler on 24.07.22.
//

import SwiftUI

struct ControlBarView: View {
    var body: some View {
        VStack {
                       
            HStack {
                Button(action: {}) {
                    Image(systemName: "checkmark.rectangle.portrait")
                        .padding(.horizontal)
                }
                .accessibilityLabel("go to All Tasks")
                
                Button(action: {}) {
                    Image(systemName: "folder")
                        .padding(.horizontal)
                }
                .accessibilityLabel("go to Projects")
                
                Spacer()
                ZStack {
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.black)
                            .background(Circle())
                    }
                    .accessibilityLabel("New Task") // ./Element (binding)?!
        
                }
                .padding(.bottom)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "calendar")
                        .padding(.horizontal)
                }
                .accessibilityLabel("go to All Calendar")
                
                Button(action: {}) {
                    Image(systemName: "timer")
                        .padding(.horizontal)
                }
                .accessibilityLabel("go to Current Tasks")
                
            }
            .font(.title)
            
        }
        .foregroundColor(.white)
        .frame(height: 60)
        .overlay(
            Capsule(style: .continuous)
                .stroke(Color.white, lineWidth: 1))
        
    }
}
// checkmark.rectangle.portrait -> checkmark.rectangle.portrait.fill
// folder - > folder.fill
// calendar ->

struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ControlBarView()
                .background(Color.black)
                .clipShape(Capsule())
                .border(Color.white, width: 1)
                .previewLayout(.fixed(width: 384.0, height: 60))
        }
    }
}
