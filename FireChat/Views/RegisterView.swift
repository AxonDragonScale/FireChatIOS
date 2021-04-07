//
//  RegisterView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 06/04/21.
//

import SwiftUI

// TODO:
// Add validation checks for all fields

struct RegisterView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("First Name")
                            .bold()
                            .foregroundColor(.gray)
                        TextField("Ronak", text: $firstName)
                            .font(.title)
                            .autocapitalization(.words)
                            .keyboardType(.asciiCapable)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Last Name")
                            .bold()
                            .foregroundColor(.gray)
                        TextField("Harkhani", text: $lastName)
                            .font(.title)
                            .autocapitalization(.words)
                            .keyboardType(.asciiCapable)
                    }
                }
                .padding(.bottom)
                
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
                    .padding(.bottom)
                
                Text("Confirm Password")
                    .bold()
                    .foregroundColor(.gray)
                SecureField("asdf@1234", text: $confirmPassword)
                    .font(.title)
                    .autocapitalization(.none)
            }
            
            Spacer()
                .frame(width: 1, height: 50)
            
            Button(action: register) {
                Text("Register")
                    .font(.largeTitle)
                    .bold()
//                    .background(Color.purple)
//                    .cornerRadius(5.0)
            }
        }
        .navigationBarTitle("Create an account", displayMode: .inline)
        .padding()
    }
    
    private func register() {
        // validate data
        // register
        // navigate to homepage?
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}
