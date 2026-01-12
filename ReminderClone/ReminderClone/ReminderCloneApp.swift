//
//  ReminderCloneApp.swift
//  ReminderClone
//
//  Created by Lê Minh Hiếu on 8/1/26.
//

import SwiftUI

@main
struct ReminderCloneApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MyListsScreen()
            }.modelContainer(for: MyList.self)
        }
    }
}
