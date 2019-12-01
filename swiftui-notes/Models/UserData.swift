//
//  UserData.swift
//  swiftui-notes
//
//  Created by Hiléo Andersson on 19/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var notes: [Note] = []
    @Published var isEditing: Bool = false
}
