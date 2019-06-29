//
//  UserData.swift
//  swiftuidemo
//
//  Created by ismail tosun on 29.06.2019.
//  Copyright © 2019 tosun. All rights reserved.
//


import Combine
import SwiftUI


final class UserData: BindableObject {
    
    let didChange = PassthroughSubject<UserData, Never>()
    
    @UserDefault(key: "to_do_list", defaultValue: [])
    var list: [ToDo] {
        didSet {
            didChange.send(self)
        }
    }
}
