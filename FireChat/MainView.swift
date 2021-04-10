//
//  ContentView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 05/04/21.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    // Change next to an enum ??
    @State private var next: String? = nil
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color.red
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("Welcome to")
                    Text("FireChat")
                        .foregroundColor(.white)
                }
                .font(Font.largeTitle.bold())
                .padding()
                
                // ---------- NON UI STUFF ----------
                NavigationLink(destination: LoginView(), tag: "Login", selection: $next) {
                    EmptyView()
                }
                NavigationLink(destination: HomeView(), tag: "Home", selection: $next) {
                    EmptyView()
                }
            }
            .onAppear() {
                validateAuth()
            }
        }
    }
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                next = "Login"
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                next = "Home"
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
