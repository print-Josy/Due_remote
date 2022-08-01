//
//  ProjectItemView.swift
//  Due
//
//  Created by Admin on 01.08.22.
//

import SwiftUI

struct ProjectItemView: View {
    let due: DueModel
    
    var body: some View {
        ZStack {
            Text(due.title)
                .font(.custom(due.title, size: 64))
                .foregroundColor(Color.white)

            HStack {
                Text("95% – \(due.due_date)")
                    .font(.custom("", size: 14))

            }
            .font(.title)
           
            
            .frame(width: 120, height: 40)
            .background(due.theme.mainColor)
            .clipShape(Capsule())
            .offset(y: 2.5)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 80)
    }
}

struct ProjectItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectItemView(due: DueModel.sampleData[0])
    }
}
