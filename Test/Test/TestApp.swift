//
//  TestApp.swift
//  Test
//
//  Created by 유영웅 on 2022/07/22.
//

import SwiftUI

@main
struct TestApp: App {
    @StateObject private var store = Store()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, store.container.viewContext)
        }
    }
}
