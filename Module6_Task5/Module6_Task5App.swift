//
//  Module6_Task5App.swift
//  Module6_Task5
//
//  Created by macbro on 06/05/22.
//

import SwiftUI

@main
struct Module6_Task5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen_()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
