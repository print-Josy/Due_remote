//
//  DateValue.swift
//  Due
//
//  Created by Josef Wengler on 01.08.22.
//

import SwiftUI

// date Value model
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
