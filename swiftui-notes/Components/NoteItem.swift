//
//  NoteItem.swift
//  swiftui-notes
//
//  Created by Hiléo Andersson on 19/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import SwiftUI

struct NoteItem: View {
    @EnvironmentObject var userData: UserData
    @State var removeModalOpened: Bool = false
    var isEditing: Bool
    var note: Note

    var body: some View {
        HStack {
            if self.isEditing {
                Button(action: openRemoveModal, label: {
                    HStack {
                        Image(systemName: "minus.circle")
                            .foregroundColor(Color.red)
                        Text(self.note.message)
                        Spacer()
                        if self.note.completed {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color.green)
                        }
                    }
                })
            } else {
                NavigationLink(destination: NoteEditView(note: self.note)) {
                    Text(self.note.message)
                    Spacer()
                    if self.note.completed {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.green)
                    }
                }
            }
        }
        .alert(isPresented: $removeModalOpened) {
            Alert(title: Text("Atenção"), message: Text("Deseja remover essa nota?"), primaryButton: .default(Text("Sim"), action: removeNote), secondaryButton: .cancel(Text("Não")))
        }
    }
    
    private func openRemoveModal() {
        removeModalOpened.toggle()
    }
    
    private func removeNote() {
        let noteSelectedIndex = userData.notes.firstIndex(where: { $0.id == note.id })
        if let selectedIndex = noteSelectedIndex {
            userData.notes.remove(at: selectedIndex)
        }
    }
}

struct NoteItem_Previews: PreviewProvider {
    static var previews: some View {
        NoteItem(isEditing: true, note: Note("Estevam Marques", completed: true))
    }
}
