//
//  RegisterView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 06/04/21.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            Text("Register View")
        }
        .navigationBarTitle("Create an account", displayMode: .inline)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}
