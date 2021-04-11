//
//  DatabaseManager.swift
//  FireChat
//
//  Created by Ronak Harkhani on 09/04/21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    // Singleton
    public static let instance = DatabaseManager()
    private init() {}
    
    private let db = Database.database().reference()
}

// Account Management
extension DatabaseManager {
    /// Inserts given user into the Database
    public func insertUser(with user: User) {
        db.child("users").child(user.userId).setValue([
            "firstName": user.firstName,
            "lastName": user.lastName,
            "email": user.email
        ])
    }
    
    /// Checks if a user with given email already exists in the Database and executes the completion function
//    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
//        db.child("users")
//            .child(User.getUserId(from: email))
//            .observeSingleEvent(of: .value, with: { snapshot in
//                guard snapshot.value as? String != nil else {
//                    print("User doesn't exist")
//                    completion(false)
//                    return
//                }
//
//                print("User exists")
//                print(snapshot.value!)
//
//                completion(true)
//            })
//    }
}
