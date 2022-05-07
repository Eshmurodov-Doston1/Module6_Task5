//
//  HomeScreen .swift
//  Module6_Task5
//
//  Created by macbro on 06/05/22.
//

import SwiftUI

struct HomeScreen_: View {
    
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var studentList: FetchedResults<Student>
    
    
    
    @State var isModule = false
    
  
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(studentList,id:\.id) { student in
                     StudentItem(student: student)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Student List",displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    isModule = true
                }, label: {
                    Text("Add")
                })
            )
            .sheet(isPresented: $isModule, content: {
                AddScreen()
            })
           
           
            
        }
    }
}

struct HomeScreen__Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen_()
    }
}
