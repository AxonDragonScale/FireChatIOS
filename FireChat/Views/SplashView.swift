//
//  SplashView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 11/04/21.
//

import SwiftUI
import FirebaseAuth

struct SplashView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
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
        }
        .onAppear() {
            validateAuth()
        }
    }
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                screenRouter.toScreen(.Login)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                screenRouter.toScreen(.Home)
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(ScreenRouter())
    }
}
