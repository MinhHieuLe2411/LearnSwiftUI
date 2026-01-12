//
//  MyListsScreen.swift
//  ReminderClone
//
//  Created by Lê Minh Hiếu on 8/1/26.
//

import SwiftUI
import SwiftData

struct MyListsScreen: View {
    
    @Query private var myLists: [MyList]
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            Text("My Lists")
                .font(.largeTitle)
                .bold()
            
            ForEach(myLists) { list in
                NavigationLink {
                    MyListDetailScreen(myList: list)
                } label: {
                    HStack {
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(Color(hex: list.colorCode))
                        Text(list.name)
                    }
                }
                
                
            }
            
            Button {
                isPresented = true
            } label: {
                Text("Add List")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }.listRowSeparator(.hidden)

        }.listStyle(.plain)
            .sheet(isPresented: $isPresented) {
                NavigationStack {
                    AddMyListScreen()
                }
            }
    }
}

#Preview { @MainActor in
    NavigationStack {
        MyListsScreen()
    }.modelContainer(previewContainer)
}
