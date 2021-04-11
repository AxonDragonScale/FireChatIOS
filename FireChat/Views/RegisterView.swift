//
//  RegisterView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 06/04/21.
//

import SwiftUI
import FirebaseAuth

// TODO:
// Add validation checks for all fields -
//    * First and Last name not empty
//    * Email has proper format
//    * Password has length > 8, a small letter, a caps letter and a number
// Show red border or something if field is invalid?

struct RegisterView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    // For nav/actions
    @State private var isProfilePicActionSheetPresented = false
    @State private var alertType: AlertType?
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill.badge.plus")
                .font(.system(size: 100))
                .padding(.bottom, 40)
                .onTapGesture { isProfilePicActionSheetPresented = true }
                .actionSheet(isPresented: $isProfilePicActionSheetPresented) {
                    ActionSheet(
                        title: Text("Profile Picture"),
                        message: Text("How would you like to select a profile picture"),
                        buttons: [
                            .default(Text("Take a picture"), action: takePictureInCamera),
                            .default(Text("Choose a picture"), action: selectPictureFromLibrary),
                            .cancel()
                        ]
                    )
                }
                        
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
            }
            
            // ---------- NON UI STUFF ----------
            alert()
        }
        .navigationBarTitle("Create an account", displayMode: .inline)
        .padding()
    }
    
    private func alert() -> some View {
        Text("")
            .hidden()
            .alert(item: $alertType) { type -> Alert in
                switch type {
                case .UserAlreadyExists:
                    return getAlert(title: "User already exists.", message: "A user with the same email already exists.")
                case .InvalidData:
                    return getAlert(title: "Invalid Data", message: "Please make sure the data is valid")
                case .Default:
                    return getAlert(title: "Error", message: "Something went wrong")
                }
            }
    }
    
    private func getAlert(title: String, message: String) -> Alert {
        return Alert(
            title: Text(title),
            message: Text(message)
        )
    }
    
    private func showAlert(for type: AlertType) {
        alertType = type
    }
    
    enum AlertType: Identifiable {
        var id: AlertType { self }
        case UserAlreadyExists, InvalidData, Default
    }
    
    private func register() {
        // Validate the user's registration data
        guard !firstName.isEmpty
                && !lastName.isEmpty
                && validateEmail(email)
                && validatePassword(password, confirmPassword) else {
            showAlert(for: .InvalidData)
            return
        }
        
        // Register user with firebase if not already registered
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
            guard let result = authResult, error == nil else {
                print("Error creating user.")
                let errorCode = AuthErrorCode(rawValue: error!._code)
                switch errorCode {
                case .invalidEmail:
                    alertType = .InvalidData
                case .emailAlreadyInUse:
                    alertType = .UserAlreadyExists
                default:
                    alertType = .Default
                }
                return
            }
            
            // Insert user in DB
            DatabaseManager.instance.insertUser(with: User(firstName: firstName,
                                                           lastName: lastName,
                                                           email: email,
                                                           userId: result.user.uid))
            
            // Go to Home Screen
            screenRouter.toScreen(.Home)
        })
    }
    
    private func validateEmail(_ email: String) -> Bool {
        // TODO: Proper validation
        return !email.isEmpty
    }
    
    private func validatePassword(_ password: String, _ confirmPassword: String) -> Bool {
        // TODO: Validate length, small letter, capital letter and symbol
        return !password.isEmpty && password == confirmPassword
    }
    
    // Pick image - https://augmentedcode.io/2020/11/22/using-an-image-picker-in-swiftui/
    // No native way in swiftui yet, have to wrap UIKit Version
    private func takePictureInCamera() {
        // open camera and take pic
    }
    
    private func selectPictureFromLibrary() {
        // select pic from photo Library
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
                .environmentObject(ScreenRouter())
        }
    }
}
