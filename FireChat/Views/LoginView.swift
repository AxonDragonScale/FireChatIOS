//
//  LoginView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 06/04/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Email")
                    .bold()
                    .foregroundColor(.gray)
                TextField("ronak@example.com", text: $email)
                    .font(.title)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding(.bottom, 20)
                
                Text("Password")
                    .bold()
                    .foregroundColor(.gray)
                SecureField("asdf@1234", text: $password)
                    .font(.title)
                    .autocapitalization(.none)
                    .padding(.bottom, 20)
            }
            
            Spacer()
                .frame(width: 1, height: 50, alignment: .center)
            
            // TODO: Change destination to homepage or something
            NavigationLink(destination: RegisterView()) {
                Text("Sign In")
                    .font(.largeTitle)
                    .bold()
            }
        }
        .navigationBarTitle("Log In", displayMode: .automatic)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: NavigationLink(destination: RegisterView()) {
            Text("Register");
        })
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
