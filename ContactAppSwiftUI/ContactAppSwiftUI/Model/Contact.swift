//
//  Contact.swift
//  ContactAppSwiftUI
//
//  Created by Rahul Nimje on 11/03/23.
//

import Foundation

class Contact {
    var id = UUID().uuidString
    var firstName = ""
    var lastName = ""
    
    init(firstName: String = "", lastName: String = "") {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    static var tempData: [Contact] = [
        Contact(firstName: "Rahul", lastName: "Nimje"),
        Contact(firstName: "Anand", lastName: "Nimje")
    ]
    
}
