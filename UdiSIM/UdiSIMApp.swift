//
//  UdiSIMApp.swift
//  UdiSIM
//
//  Created by 유영웅 on 2022/11/19.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

@main
struct UdiSIMApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var vm = AuthenticationViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(vm)
            .environmentObject(ChatViewModel(user: vm.userdata))
        }
    }
}

class AppDelegate:NSObject,UIApplicationDelegate{
    func application(_ application:UIApplication,didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
