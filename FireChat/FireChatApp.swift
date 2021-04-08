//
//  FireChatApp.swift
//  FireChat
//
//  Created by Ronak Harkhani on 05/04/21.
//

import SwiftUI
import Firebase

@main
struct FireChatApp: App {
    
    // May need to move this to app delegate for other firebase functionalities
    // https://peterfriese.dev/swiftui-new-app-lifecycle-firebase/
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
