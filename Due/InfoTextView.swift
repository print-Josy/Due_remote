//
//  InfoTextView.swift
//  Due
//
//  Created by Josef Wengler on 31.07.22.
//

import SwiftUI

struct InfoTextView: View {
    let due: DueModel
    @State private var username: String = "Projekt Infos\nEine kurze Zusammenfassung von den Aufgaben zur besseren Übersicht!"


    
    
    var body: some View {
        VStack(alignment: .leading) {
            Section(header: Text("Zusätzliche Infos:")) {
                ZStack {
                    TextEditor(text: $username)
                        .frame(minHeight: 200, idealHeight: 150, maxHeight: 200, alignment: .topLeading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1))
                        .font(.callout)
                }
                .onAppear() {
                    UITextView.appearance().backgroundColor = .clear
                }
            }
        }

    }
}

struct InfoTextView_Previews: PreviewProvider {
    static var previews: some View {
        InfoTextView(due: DueModel.sampleData[0])
            .padding(.horizontal)
    }
}



