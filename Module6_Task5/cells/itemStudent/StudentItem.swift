//
//  StudentItem.swift
//  Module6_Task5
//
//  Created by macbro on 07/05/22.
//

import SwiftUI

struct StudentItem: View {
    var student:Student
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        HStack(alignment:.top) {
            VStack(alignment:.leading) {
                Text("\(student.firstName!) \(student.lastName!)")
                    .fontWeight(.bold)
                    .lineLimit(2)
                Spacer()
                Text("\(student.phone!) | \(student.email!)")
                    .lineLimit(2)
                Spacer()
                Text(student.address!)
                    .lineLimit(2)
            }
            Spacer()
            Text(student.gender!)
                .frame(alignment: .trailing)
                .foregroundColor(.red)
                .lineLimit(1)
        }
        .padding()
     }
}

struct StudentItem_Previews: PreviewProvider {
    static var previews: some View {
        StudentItem(student: Student())
    }
}
