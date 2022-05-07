//
//  AddScreen.swift
//  Module6_Task5
//
//  Created by macbro on 06/05/22.
//

import SwiftUI

struct AddScreen: View {
    
    
    @Environment(\.presentationMode) var presentation
    
    @Environment(\.managedObjectContext) var moc
    
    
    
    // first section
    @State var firstName = ""
    @State var lastName = ""
    @State var type = ""
    let types = ["Male","Woman"]
    // second section
    @State var phone = ""
    @State var email = ""
    @State var address = ""
    
    
    
    
    
    func saveStudent(firstName:String,lastName:String,
                     type:String,phone:String,email:String,address:String){
        
        let student = Student(context: self.moc)
        student.id = UUID()
        student.firstName = firstName
        student.lastName = lastName
        student.gender = type
        student.phone = phone
        student.email = email
        student.address = address
        
        try? self.moc.save()
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Firstname", text: $firstName)
                    
                    TextField("Lastname", text: $lastName)
                    Picker("Type",selection: $type){
                        ForEach(types, id:\.self) {
                        Text($0)
                        }
                    }
                }
                Section {
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                }
            }
            .navigationBarTitle("Add Student",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                  saveStudent(firstName: firstName, lastName: lastName, type: type, phone: phone, email: email, address: address)
                presentation.wrappedValue.dismiss()
                }, label: {
                    Text("Add")
                }))
        }
    }
    
   
    
}



struct AddScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddScreen()
    }
}
