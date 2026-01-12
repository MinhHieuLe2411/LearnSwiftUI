//
//  PreviewContainer.swift
//  ReminderClone
//
//  Created by Lê Minh Hiếu on 10/1/26.
//

import Foundation
import SwiftData

@MainActor
var previewContainer: ModelContainer! = {
    let container = try! ModelContainer(for: MyList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for mylist in SampleData.myLists {
        container.mainContext.insert(mylist)
        mylist.reminder = SampleData.reminders
    }
    
    return container
}()

struct SampleData {
    static var myLists: [MyList] {
        return [MyList(name: "Reminders", colorCode: "#2ecc71"),
                MyList(name: "Backlog", colorCode: "#9b59b6")]
    }
    
    static var reminders: [Reminder] {
        return [Reminder(title: "Reminder 1"), Reminder(title: "Reminder 2", notes: "This is reminder 2 note"), Reminder(title: "Reminder 3")]
    }
}
