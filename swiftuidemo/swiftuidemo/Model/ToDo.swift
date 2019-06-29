//
//  File.swift
//  swiftuidemo
//
//  Created by ismail tosun on 13.06.2019.
//  Copyright © 2019 tosun. All rights reserved.
//

import SwiftUI

struct ToDo : Equatable,Hashable,Codable,Identifiable {
    var id     = UUID()
    var isDone : Bool
    var text   : String
}
