

import CoreData
import Foundation

class Store:ObservableObject{
     let container = NSPersistentContainer(name: "Test")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core Data를 불러오는데 실패했습니다. : \(error.localizedDescription)")
            }
        }
    }
}
