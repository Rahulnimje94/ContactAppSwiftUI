//
//  ContentView.swift
//  ContactAppSwiftUI
//
//  Created by Rahul Nimje on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var contactArray = Contact.tempData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<contactArray.count, id: \.self) { index in
                    ContactCell(contact: contactArray[index])
                        .swipeActions {
                            Button {
                                contactArray.remove(at: index)
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                        .swipeActions {
                            Button {
                                openAlert(isAdd: false, index: index)
                            } label: {
                                Text("Update")
                            }.tint(.indigo)
                        }
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        openAlert(isAdd: true)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

// MARK: - Helper Methods
extension ContentView {
    
    func openAlert(isAdd: Bool, index: Int = 0) {
        let alertController = UIAlertController(title: isAdd ? "Add Contact" : "Update Contact", message: isAdd ? "Please Enter Your Contact Details" : "Please Update your contact Details", preferredStyle: .alert)
        
        alertController.addTextField { firstNameField in
            firstNameField.placeholder = isAdd ? "Enter your first Name" : contactArray[index].firstName
        }
        
        alertController.addTextField { lastNameField in
            lastNameField.placeholder = isAdd ? "Enter Your last Name" : contactArray[index].lastName
        }
        
        let save = UIAlertAction(title: isAdd ? "Save" : "Update", style: .default) { _ in
            if let firstName = alertController.textFields?.first?.text,
               let lastName = alertController.textFields?[1].text {
                let contact = Contact(firstName: firstName, lastName: lastName)
                if isAdd {
                    contactArray.append(contact)
                } else {
                    contactArray[index] = contact
                }
            }
        }
        
        alertController.addAction(save)
        
        UIApplication.shared.currentUIWindow()?.rootViewController?.present(alertController, animated: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
