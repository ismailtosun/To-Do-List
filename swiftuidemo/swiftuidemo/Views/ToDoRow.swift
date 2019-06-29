
//
//  ToDoRow.swift
//  swiftuidemo
//
//  Created by ismail tosun on 8.06.2019.
//  Copyright © 2019 tosun. All rights reserved.
//

import SwiftUI

struct ToDoRow : View {
    
    @EnvironmentObject var userData : UserData
    @State var isCheck : Bool = false
    let toDo : ToDo
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "minus")
                .font(.headline)
                .foregroundColor(.red)
                .padding(.leading,8)
            
            VStack {
                Text(toDo.text)
                    .strikethrough(toDo.isDone ? true:false,color:.red)
                    .font(.body)
                    .lineLimit(nil)
            }
            Spacer()
            Image(systemName: toDo.isDone ? "checkmark.square.fill" : "square")
                .foregroundColor(.red)
                .tapAction {
                    self.isCheck.toggle()
                    if(self.isCheck) {
                        guard let index = self.userData.list.firstIndex(where: { $0.id == self.toDo.id }) else { return }
                        self.userData.list[index].isDone = true
                    }
                    else {
                        guard let index = self.userData.list.firstIndex(where: { $0.id == self.toDo.id }) else { return }
                        self.userData.list[index].isDone = false
                    }
            }
        }
    }
}



