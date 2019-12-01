//
//  HomeView.swift
//  swiftui-notes
//
//  Created by Hiléo Andersson on 19/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import SwiftUI

struct NotesListView: View {
    @EnvironmentObject var userData: UserData
    @State var note: String = ""

    var body: some View {
        NavigationView {
            List {
                TextField("Create a new note...", text: $note, onCommit: createNote)
                ForEach(userData.notes, id: \.id) { n in
                    NoteItem(isEditing: self.userData.isEditing, note: n)
                }
            }
            .navigationBarTitle(Text("Notes 👀"))
            .navigationBarItems(trailing: Button(action: {
                self.userData.isEditing.toggle()
            }, label: {
                if self.userData.isEditing {
                    Text("Done").bold()
                } else {
                    Text("Edit")
                }
            }))
        }
    }
    
    private func createNote() {
        userData.notes.append(Note(self.note))
        self.note = ""
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
            .environmentObject(UserData())
    }
}
