import SwiftUI
import SwiftData

struct NoteView: View {
    @State var noteBody = Note()
    @State var showingMainsSheet = false
    @State var showingStagesSheet = false
    @Environment(\.modelContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
    private func handleSave() {
            context.insert(noteBody)
            try? context.save()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextField(
                        "Inserte el jugador",
                        text: $noteBody.playerName
                    )
                    .font(Font.system(size: 30, design: .default))
                    .disableAutocorrection(true)
                    HStack {
                        SelectablesSection(title: "Personajes", listOptions: characters, hasIcon: true, circularShape: true, selectedItems: $noteBody.characters)
                        Spacer()
                        Divider()
                        Spacer()
                        SelectablesSection(title: "Escenarios", listOptions: stages, sectionHeader: "Smash Ultimate", secondSectionHeader: "Melee", secondListOptions: meleeStages, selectedItems: $noteBody.stages)
                    }
                    HabitsList(noteBody: $noteBody, context: context)
                    Detail(title: "Condicion de victoria", inputValue: $noteBody.winCondition, inputPlaceholder: "Escribe aqui la condicion de victoria.")
                        Detail(title: "Comentarios", inputValue: $noteBody.extraDetails, inputPlaceholder: "Escribe cosas a tener en cuenta.")
                        Spacer()
                    }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
            }
        .onDisappear {
            if (noteBody.playerName.isEmpty) {
                context.delete(noteBody)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                handleSave()
            }
        }
        }
    }
