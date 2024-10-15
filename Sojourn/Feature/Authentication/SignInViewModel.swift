//
//  SignInViewModel.swift
//  Sojourn
//
//  Created by Jason Karcheski on 14/10/2024.
//

import Foundation

@Observable
final class SignInViewModel {
	
	var email: String = ""
	var emailError: ValidationError? = nil
	var password: String = ""
	var passwordError: ValidationError? = nil
	var signInError: Error? = nil
	private let authManager: AuthenticationManager
	
	init(authenticationManager: AuthenticationManager = AuthenticationManager()) {
		self.authManager = authenticationManager
	}
	
	func signIn(onSuccess: @escaping () -> Void) {
		validateCredentials()
		guard emailError == nil, passwordError == nil else { return }
		
		Task {
			do {
				let user = try await authManager.signIn(email: email, password: password)
				print("Sign In: Success - \(user)")
				signInError = nil
				onSuccess()
			} catch {
				signInError = error
				print("Sign In: Error - \(error)")
			}
		}
	}
	
	private func validateCredentials() {
		emailError = email.isValidEmail()
		passwordError = password.isValidPassword()
		
		if emailError != nil { print("SignInViewModel.validateCredentials: Error - \(String(describing: emailError))") }
		if passwordError != nil { print("SignInViewModel.validateCredentials: Error - \(String(describing: passwordError))") }
	}
	
}

enum ValidationError: Error {
	case emailEmpty, emailInvalid, passwordEmpty, passwordShort, passwordInvalid
	
	var message: String {
		switch self {
		case .emailEmpty:
			"Email cannot be empty"
		case .emailInvalid:
			"Email is not in a correct format"
		case .passwordEmpty:
			"Password cannot be empty"
		case .passwordShort:
			"Passwords need to be at least 8 characters long"
		case .passwordInvalid:
			"Password is invalid"
		}
	}
}

