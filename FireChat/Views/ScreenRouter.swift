//
//  ScreenRouter.swift
//  FireChat
//
//  Created by Ronak Harkhani on 11/04/21.
//

import SwiftUI

enum Screen {
    case Splash
    case Login
    case Home
}

class ScreenRouter: ObservableObject {
    @Published var currentScreen: Screen = .Splash
    
    public func toScreen(_ screen: Screen) {
        withAnimation {
            currentScreen = screen
        }
    }
}
