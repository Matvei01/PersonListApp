//
//  Person.swift
//  PersonListApp
//
//  Created by Matvei Khlestov on 18.04.2024.
//

struct Person {
    let name: String
    let surname: String
    let largePhoto: String
    let smallPhoto: String
    let description: String
    
    static func getPerson() -> [Person] {
        [
            Person(
                name: "Alexandr",
                surname: "Sidorov",
                largePhoto: "Alexandr Sidorov",
                smallPhoto: "Small photo1",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore"
            ),
            
            Person(
                name: "Andrei",
                surname: "Ivanov",
                largePhoto: "Andrei Ivanov",
                smallPhoto: "Small photo2",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore"
            ),
            
            Person(
                name: "Sergei",
                surname: "Pushkin",
                largePhoto: "Sergei Pushkin",
                smallPhoto: "Small photo3",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore"
            )
        ]
    }
}
