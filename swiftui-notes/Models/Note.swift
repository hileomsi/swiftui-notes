//
//  Note.swift
//  swiftui-notes
//
//  Created by Hiléo Andersson on 19/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import Foundation

class Note {
    let id: UUID
    var message: String
    var completed: Bool
    
    init(_ message: String, completed: Bool = false) {
        self.id = UUID()
        self.message = message
        self.completed = completed
    }
}
