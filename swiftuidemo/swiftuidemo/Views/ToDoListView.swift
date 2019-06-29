//
//  ToDoListView.swift
//  swiftuidemo
//
//  Created by ismail tosun on 8.06.2019.
//  Copyright © 2019 tosun. All rights reserved.
//

import SwiftUI
import Combine


struct ToDoListView : View {
    
    @EnvironmentObject var userData: UserData
    @State var isDone : Bool = false
    @State var text : String = ""
    
    var body: some View {
       
        NavigationView {
            
            
            VStack {
                
                TextField($text, placeholder :Text("Write your to-do here !  "),onCommit : self.addToDoList)
                    .font(.title).padding(20)
                
                
                Text("Your To-Do List ✅")
                    .color(.red)
                    .font(.headline)
                    .padding(.leading,20)
                
                
                List {
                    
                    ForEach(userData.list) { todo in
                        ToDoRow(toDo: todo)
                        }.onDelete(perform: delete)
                    
                    }.navigationBarTitle(Text("To-Do 📌"))
                    .navigationBarItems(trailing: VStack {
                        EditButton()
               })
            }
        }
    }
    
  private func addToDoList() {
    if(self.text.count > 0) {
        let todo = ToDo(isDone: false, text: self.text)
        userData.list.append(todo)
        text = ""
      }
    }
    
    private func delete(at offsets : IndexSet){
        for offset in offsets {
            userData.list.remove(at: offset)
        }
    }
    
}

