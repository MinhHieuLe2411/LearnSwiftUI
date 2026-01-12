//
//  MyListDetailScreen.swift
//  ReminderClone
//
//  Created by Lê Minh Hiếu on 12/1/26.
//

import SwiftUI
import SwiftData

struct MyListDetailScreen: View {
    
    let myList: MyList
    @State private var newReminderTitle: String = ""
    @State private var isNewReminderPresented: Bool = false
    
    private var isFormValid: Bool {
        !newReminderTitle.isEmptyOrWhitespace
    }
    
    private func saveNewReminder() {
        let reminder = Reminder(title: newReminderTitle)
        myList.reminder.append(reminder)
    }
    
    var body: some View {
        VStack {
            List(myList.reminder) { reminder in
                Text(reminder.title)
            }
            Spacer()
            Button {
                isNewReminderPresented = true
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }.navigationTitle(myList.name)
            .alert("New Reminder", isPresented: $isNewReminderPresented) {
                TextField("", text: $newReminderTitle)
                Button("Cancel", role: .cancel) {
                }
                Button("Done", role: .none) {
                    if isFormValid {
                        saveNewReminder()
                    }
                    
                }.disabled(!isFormValid)

            }

    }
}

struct MyListDetailScreenContainer: View {
    
    @Query private var myLists: [MyList]
    
    var body: some View {
        MyListDetailScreen(myList: myLists[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        MyListDetailScreenContainer()
    }.modelContainer(previewContainer)
}
