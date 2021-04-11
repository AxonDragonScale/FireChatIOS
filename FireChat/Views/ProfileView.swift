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
    
    @State private var isLogoutActionSheetPresented = false
    
    var body: some View {
        NavigationView {
            Text("ProfileView")
                .actionSheet(isPresented: $isLogoutActionSheetPresented) {
                    ActionSheet(
                        title: Text("Do you want to Log out?"),
                        buttons: [
                            .destructive(Text("Logout"), action: logout),
                            .cancel()
                        ]
                    )
                }
                .navigationTitle("Profile")
                .navigationBarItems(trailing: Button(action: { isLogoutActionSheetPresented = true }) {
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
            ProfileView()
                .environmentObject(ScreenRouter())
        }
    }
}
