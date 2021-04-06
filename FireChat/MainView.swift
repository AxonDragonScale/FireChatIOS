//
//  ContentView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 05/04/21.
//

import SwiftUI

struct MainView: View {
    @State private var next: String? = nil
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color.red
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("Welcome to")
                        .foregroundColor(.white)
        
                    Text("FireChat")
                }
                .font(Font.largeTitle.bold())
                .padding()
                
                NavigationLink(destination: LoginView(), tag: "Login", selection: $next) {
                    EmptyView()
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    next = "Login"
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
