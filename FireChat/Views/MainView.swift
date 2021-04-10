//
//  ContentView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 05/04/21.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
        switch screenRouter.currentScreen {
        case .Splash:
            SplashView()
        case .Login:
            LoginView()
        case .Home:
            HomeView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
