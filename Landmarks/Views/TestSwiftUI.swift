//
//  TestSwiftUI.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2023/12/26.
//

import SwiftUI

struct Model: Identifiable {
    var id = UUID()
    var name: String
}

var Models = [
    Model(name: "Hello"),
    Model(name: "World"),
]

protocol Persons {
    associatedtype fullName
    func say(_ name: fullName)
}

struct Person: Persons {
    
    typealias fullName = String
    func say(_ name: String) {
        print(name)
    }
}

struct TestSwiftUI: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        let person = Person()
        person.say("Hello World")
        
        
        
    }
    
    var body: some View {
        
        List {
            ForEach(Models) {Item in
                Text("\(Item.name). Hello World")
            }
        }
    }
}

#Preview {
    TestSwiftUI()
}


