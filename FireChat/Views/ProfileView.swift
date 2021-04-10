//
//  ProfileView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 10/04/21.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
        NavigationView {
            Text("ProfileView")
                .navigationBarItems(trailing: Button(action: logout) {
                    Text("Logout")
                })
        }
    }
    
    private func logout() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            screenRouter.toScreen(.Splash)
        } catch {
            print("Error while logging out.")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView {
                ProfileView()
            }
        }
    }
}
