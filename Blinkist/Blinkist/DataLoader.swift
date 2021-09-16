//
//  DataLoader.swift
//  Blinkist
//
//  Created by  Decagon on 28/07/2021.
//

import Foundation


protocol DataDelegate {
    func receiveData(_ data: [JSONDatum])
}

public class DataLoader{

@Published var userData = [JSONDatum]()
    var delegate: DataDelegate?             //DELEGATE IMPLEMENTATION

    func receiveData(){                 //loading data from parser using delegate method
        if let fileLocation = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
    // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([JSONDatum].self, from: data)
                delegate?.receiveData(dataFromJson)
            } catch {
                print("\(error)")
            }
        }

    }
    
    // MARK:- CLOSURE IMPLEMENTATION
//    init() {
//        load { [weak self] data in
//            self?.userData = data
//        }
//        sort()
//    }
//
//
//    func load(completionHandler: (([JSONDatum]) -> Void)?) {             //loading data from parser using closures
//        if let fileLocation = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
//    // do catch in case of an error
//            do {
//                let data = try Data(contentsOf: fileLocation)
//                let jsonDecoder = JSONDecoder()
//                let dataFromJson = try jsonDecoder.decode([JSONDatum].self, from: data)
//
//                completionHandler?(dataFromJson)
//            } catch {
//                print("\(error)")
//            }
//        }
//    }
//
//    func sort() {
//        self.userData = self.userData.sorted(by: {$0.id < $1.id})
//    }
}
