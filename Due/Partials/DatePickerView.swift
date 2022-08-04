//
//  DatePickerView.swift
//  Due
//
//  Created by Josef Wengler on 01.08.22.
//

import SwiftUI

struct DatePickerView: View {
   // @Binding var currentDate: Date =
    @State var currentDate: Date = Date()// test
//    @State var due: [DueModel]
    
    // Month update on arrow button ( swipe !!! )
    @State var currentMonth:  Int = 0
    
    var body: some View {
        
        VStack(spacing: 35) {
            
            //Days
            let days: [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
            
            HStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                Spacer(minLength: 0)
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            //Day View
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) {day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // Dates
            // Lazy Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                }
            }
        }
        .onChange(of: currentMonth) { newValue in
            //update Month
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) ->some View {
        
        VStack {
            if value.day != -1 {
//                if let task = due.tasks.task_date
                
                Text("\(value.day)")
                    .font(.title3.bold())
            }
        }
        .padding(.vertical, 8)
        .frame(height: 60, alignment: .top)
    }
    
    
    // extracting year and month
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        // Get Current Month Date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        // Get Current Month Date
        let currentMonth = getCurrentMonth()
                
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            // getting day
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        // adding offset days to get exact week day
        var firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        if firstWeekday > 0 {
            firstWeekday -= 1
        }
        if firstWeekday > 1 {
            for _ in 0..<firstWeekday - 1 {
                days.insert(DateValue(day: -1, date: Date()), at: 0)
            }
        }
        return days
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

// Extending Date to get Month
extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        // getting start Date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        //getting date
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1 , to: startDate)!
            
        }
    }
}
