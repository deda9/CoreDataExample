import SwiftUI
import CoreData
import Combine

var bag: [AnyCancellable] = []

struct ContentView: View {
    let coreDataStore: CoreDataStoring!
    
    @State private var number_of_persons: Int = 0
    @State private var message: String = "None"
    
    var body: some View {
        Text("Message")
        Text("\(message)").foregroundColor(.green)
        Text("number of persons \(number_of_persons)")
            .padding()
        
        Button(action: addPerson) {
            Label("Add Person", systemImage: "plus")
        }.padding()
        
        Button(action: fetchPersons) {
            Text("Fetch Persons Count")
        }.padding()
        
        Button(action: deleteAllPersons) {
            Text("Delte All Persons")
        }.padding()
        
    }
    
    private func addPerson() {
        let bezo: Person = coreDataStore.createEntity()
        bezo.first_name = "Bezo"
        bezo.last_name = "Deda"
        
        let volksCar: Car = coreDataStore.createEntity()
        volksCar.name = "Volkswagen"
        volksCar.owner = bezo
        
        let bmwCar: Car = coreDataStore.createEntity()
        bmwCar.name = "BMW"
        bmwCar.owner = bezo
        
        bezo.cars = [volksCar, bmwCar]
        coreDataStore.saveSync()
        message = "Saving entities succeeded"
        number_of_persons += 1
    }
    
    private func fetchPersons() {
        let users: [Person] = coreDataStore.fectch()
        message = "Fetching entities succeeded"
        number_of_persons = users.count
        
    }
    
    private func deleteAllPersons() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Person.entityName)
        coreDataStore.delete(request: request)
        message = "Deleting entities succeeded"
        number_of_persons = 0
    }
}
