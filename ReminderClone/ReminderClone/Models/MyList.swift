//
//  MyList.swift
//  ReminderClone
//
//  Created by Lê Minh Hiếu on 10/1/26.
//

import Foundation
import SwiftData

@Model
class MyList: Identifiable {
    var name: String
    var colorCode: String
    
    @Relationship(deleteRule: .cascade)
    var reminder: [Reminder] = []
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
}
