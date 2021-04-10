//
//  ProfileView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 10/04/21.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    var body: some View {
        Text("ProfileView")
            .navigationBarItems(trailing: Button(action: logout) {
                Text("Logout")
            })
    }
    
    private func logout() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
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
