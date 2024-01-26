//
//  CoreDataMVVMExample.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI
import CoreData


class FruitViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        fetchFruits()
    }
    
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("Error fetch \(error.localizedDescription)")
        }
    }
    
    func addFruit(text: String){
        let fruit = FruitEntity(context: container.viewContext)
        fruit.name = text
        
        saveChanges()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = savedEntities[index]
        
        container.viewContext.delete(fruit)
        
        saveChanges()
    }
    
    func updateFruit(fruit: FruitEntity) {
        fruit.name! += "!"
        
        saveChanges()
    }
    func saveChanges() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
                fetchFruits()
            } catch {
                print("Could not save changes to Core Data.", error.localizedDescription)
            }
        }
    }
    
}


struct CoreDataMVVMExample: View {
    
    @ObservedObject var vm = FruitViewModel()
    @State var name: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Input name", text: $name)
                    .padding()
                    .background(.gray.opacity(0.3))
                
                Button {
                    print("Button tapped")
                    vm.addFruit(text: name)
                } label: {
                    Text("save")
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                List {
                    ForEach(vm.savedEntities) { fruit in
                        Text(fruit.name ?? "Error")
                            .onTapGesture {
                                vm.updateFruit(fruit: fruit)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                    
                }.listStyle(.plain)
                
            }
            .padding()
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataMVVMExample()
}
