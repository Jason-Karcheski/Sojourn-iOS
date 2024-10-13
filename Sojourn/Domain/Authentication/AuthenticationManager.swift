//
//  AuthenticationManager.swift
//  Sojourn
//
//  Created by Jason Karcheski on 14/10/2024.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
	
	static let shared = AuthenticationManager()
	
	func createUser(email: String, password: String) async throws -> FirebaseUser {
		let result = try await Auth.auth().createUser(withEmail: email, password: password)
		return FirebaseUser(user: result.user)
	}
	
}
