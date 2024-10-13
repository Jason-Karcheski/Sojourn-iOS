//
//  SignInViewModel.swift
//  Sojourn
//
//  Created by Jason Karcheski on 14/10/2024.
//

import Foundation

@MainActor
final class SignInViewModel {
	
	func signIn(email: String, password: String) {
		guard !email.isEmpty, !password.isEmpty else {
			print("Email or password are empty")
			return
		}
		
		Task {
			do {
				let user = try await AuthenticationManager.shared.signIn(email: email, password: password)
				print("Sign In: Success - \(user)")
			} catch {
				print("Sign In: Error - \(error)")
			}
		}
	}
	
}
