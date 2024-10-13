//
//  CreateAccountViewModel.swift
//  Sojourn
//
//  Created by Jason Karcheski on 14/10/2024.
//

import Foundation

@MainActor
final class CreateAccountViewModel {
	
	func createAccount(email: String, password: String) {
		// TODO: Real email and password validation here to be done.
		guard !email.isEmpty, !password.isEmpty else {
			print("email or password are empty")
			return
		}
		
		Task {
			do {
				let user = try await AuthenticationManager.shared.createUser(email: email, password: password)
				print("Create Account: Success - \(user)")
			} catch {
				print("Create Account: Error - \(error)")
			}
		}
	}
	
}
