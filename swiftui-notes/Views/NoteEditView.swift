//
//  TaskEditView.swift
//  swiftui-notes
//
//  Created by Hiléo Andersson on 19/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import SwiftUI

struct NoteEditView: View {
    @State var note: Note
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Form {
            TextField("", text: $note.message, onEditingChanged: { _ in
                self.editNote({ userData, selectedIndex in
                    userData.notes[selectedIndex].message = self.note.message
                })
            })
        }
        .navigationBarTitle(Text("Edit Note 📝"))
        .navigationBarItems(trailing: Button(action: completeNote, label: {
            Text("Complete")
        }))
    }
    
    private func editNote(_ onSuccess: (UserData, Int) -> Void) {
        var noteSelectedIndex: Int? {
            userData.notes.firstIndex(where: { $0.id == self.note.id })
        }
        if let selectedIndex = noteSelectedIndex {
            onSuccess(userData, selectedIndex)
        }
    }
    
    private func completeNote() {
        self.editNote({ userData, selectedIndex in
            userData.notes[selectedIndex].completed = true
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}

struct NoteEditView_Previews: PreviewProvider {
    static var previews: some View {
        NoteEditView(note: Note("Minha nota"))
    }
}
