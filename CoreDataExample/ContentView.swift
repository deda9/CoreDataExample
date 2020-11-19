//
//  ContentView.swift
//  CoreDataExample
//
//  Created by Deda on 18.11.20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let coreDataStore: CoreDataStoring = CoreDataStore.default
    
    var body: some View {
        Button(action: addPerson) {
            Label("Add Person", systemImage: "plus")
        }
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
        
        let users: [Person] = coreDataStore.fectch()
        
        users.forEach {
            print($0)
        }
    }
}
