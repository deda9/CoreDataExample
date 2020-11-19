# CoreDataExample

It's just a Sugar syntact for the CoreData

You can create entity 
```Swift
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
```

Then you can save this entity by calling save/saveAsync:
  ```Swift
  coreDataStore.saveSync()

```
Then you can fecth the data:
```Swift
  let users: [Person] = coreDataStore.fectch()

  users.forEach {
      print($0)
  }
```
