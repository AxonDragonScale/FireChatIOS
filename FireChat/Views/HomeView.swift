//
//  HomeView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 10/04/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ChatsView()
                .tabItem {
                    Label("Chats", systemImage: "message")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
