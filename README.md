# CoreDataExample

<img src="https://github.com/deda9/CoreDataExample/blob/main/image.png" width="300px"/>

## It's just a Sugar syntact for the CoreData


## Create Entity
```Swift
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
  }
```

## Save Entity
  ```Swift
  coreDataStore.saveSync()

```
## Fetch Entity
```Swift
private func fetchPersons() {
      let users: [Person] = coreDataStore.fectch()
      message = "Fetching entities succeeded"
      number_of_persons = users.count

  }
```


## Delete Entity
```Swift
private func deleteAllPersons() {
      let request = NSFetchRequest<NSFetchRequestResult>(entityName: Person.entityName)
      coreDataStore.delete(request: request)
      message = "Deleting entities succeeded"
      number_of_persons = 0
  }
```


You can read the tutorial on Medium [Tutorial Link](https://deda9.medium.com/ios-core-data-with-sugar-syntax-ef53a0e06efe)
