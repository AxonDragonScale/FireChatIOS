//
//  LoginView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 06/04/21.
//

import SwiftUI

// TODO:
// Auto focus on next text field
// Highlight currently selected text field
// Validate input on commit and give alerts
// Change alert text based on issue

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var next: String? = nil
    @State private var alertPresented: Bool = false
    
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
                    .padding(.bottom)
//                    .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.gray))
//                    .background(Color(UIColor.lightGray))
//                    .cornerRadius(10.0)
                
                Text("Password")
                    .bold()
                    .foregroundColor(.gray)
                SecureField("asdf@1234", text: $password)
                    .font(.title)
                    .autocapitalization(.none)
            }
            
            Spacer()
                .frame(width: 1, height: 50)
            
            // TODO: Change destination to homepage or something
            Button(action: login) {
                Text("Log In")
                    .font(.largeTitle)
                    .bold()
//                    .background(Color.purple)
//                    .cornerRadius(5.0)
            }
            
            // Alert
            EmptyView()
                .alert(isPresented: $alertPresented) {
                    Alert(
                        title: Text("Incorrect credentials"),
                        message: Text("The email or password cannot be empty")
                    )
                }
            
            NavigationLink(destination: Text("Home Page"), tag: "Home", selection: $next) {
                EmptyView()
            }
            
            // NavigationLink for RegisterView (Here bcoz navLinks don't work properly inside navBar)
            NavigationLink(destination: RegisterView(), tag: "Register", selection: $next) {
                EmptyView()
            }
        }
        .navigationBarTitle("Log In", displayMode: .automatic)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            trailing: Button(action: gotoRegisterView) {
                Text("Register");
            })
        .padding()
    }
    
    private func gotoRegisterView() {
        next = "Register"
    }
    
    private func login() {
        guard !email.isEmpty && password.count > 8 else {
            alertPresented = true
            return
        }
        
        // Login
        
        // set next to Home page?
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
