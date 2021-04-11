//
//  LoginView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 06/04/21.
//

import SwiftUI
import FirebaseAuth

// TODO:
// Auto focus on next text field
// Highlight currently selected text field
// Validate input on commit and give alerts
// Change alert text based on issue

struct LoginView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var next: String? = nil
    @State private var alertPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image(systemName: "message.circle.fill")
                    .font(.system(size: 150))
                    .padding(.vertical, 20)
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Email")
                        .bold()
                        .foregroundColor(.gray)
                    TextField("ronak@example.com", text: $email)
                        .font(.title)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding(.bottom)
                    
                    Text("Password")
                        .bold()
                        .foregroundColor(.gray)
                    SecureField("asdf@1234", text: $password)
                        .font(.title)
                        .autocapitalization(.none)
                }
                
                Spacer()
                    .frame(width: 1, height: 50)
                
                Button(action: login) {
                    Text("Log In")
                        .font(.largeTitle)
                        .bold()
                }
                
                Spacer()
                
                // ---------- NON UI STUFF ----------
                Text("")
                    .hidden()
                    .alert(isPresented: $alertPresented) {
                        Alert(
                            title: Text("Incorrect credentials"),
                            message: Text("The email or password cannot be empty")
                        )
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
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
            guard let result = authResult, error == nil else {
                print("Login failed.")
                return
            }
            
            print("Login in Successful: \(result.user)")
        })
        
        // Go to Home Screen
        screenRouter.toScreen(.Home)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(ScreenRouter())
    }
}
