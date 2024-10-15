//
//  AuthenticationManager.swift
//  Sojourn
//
//  Created by Jason Karcheski on 14/10/2024.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
	
	func createUser(email: String, password: String) async throws -> FirebaseUser {
		let result = try await Auth.auth().createUser(withEmail: email, password: password)
		return FirebaseUser(user: result.user)
	}
	
	func signIn(email: String, password: String) async throws -> FirebaseUser {
		let result = try await Auth.auth().signIn(withEmail: email, password: password)
		return FirebaseUser(user: result.user)
	}
	
	func currentUser() -> FirebaseUser? {
		if let user = Auth.auth().currentUser {
			return FirebaseUser(user: user)
		}
		
		return nil
	}
}
