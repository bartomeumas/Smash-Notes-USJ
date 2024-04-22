import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var notes: [Note] = []
    @State private var showingQuitConfirmationModal = false
    @State private var searchText = ""

    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return notes.filter { !$0.playerName.isEmpty }
        } else {
            return notes.filter { $0.playerName.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                if notes.isEmpty {
                    Text("Create some notes")
                } else {
                    List {
                        ForEach(filteredNotes, id: \.id) { note in
                            NavigationLink(destination: NoteView(noteBody: note)) {
                                NoteRow(note: note)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            for index in indexSet {
                                let noteToDelete = filteredNotes[index]
                                context.delete(noteToDelete)
                            }
                        })
                    }
                }
            }
            .frame(alignment: .leading)
            .navigationTitle(Text("Smash Notes"))
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    NavigationLink(destination: NoteView()) {
                        HStack {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Buscar por nombre")
    }
}
