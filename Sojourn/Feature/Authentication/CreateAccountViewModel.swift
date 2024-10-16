//
//  CreateAccountViewModel.swift
//  Sojourn
//
//  Created by Jason Karcheski on 14/10/2024.
//

import Foundation

@Observable
final class CreateAccountViewModel {
	
	var email: String = ""
	var emailError: ValidationError? = nil
	var password: String = ""
	var passwordError: ValidationError? = nil
	var confirmPassword: String = ""
	var confirmPasswordError: ValidationError? = nil
	private let authManager: AuthenticationManager
	
	init(authManager: AuthenticationManager = AuthenticationManager()) {
		self.authManager = authManager
	}
	
	func createAccount(onSuccess: @escaping () -> Void) {
		validateCredentials()
		guard emailError == nil, passwordError == nil, confirmPasswordError == nil else { return }
		
		Task {
			do {
				let user = try await authManager.createUser(email: email, password: password)
				print("Create Account: Success - \(user)")
				onSuccess()
			} catch {
				print("Create Account: Error - \(error)")
			}
		}
	}
	
	private func validateCredentials() {
		emailError = email.isValidEmail()
		passwordError = password.isValidPassword()
		confirmPasswordError = confirmPassword.isValidPasswordConfirmation(for: password)
		
		if emailError != nil { print("CreateAccountViewModel.validateCredentials: Error - \(String(describing: emailError))") }
		if passwordError != nil { print("CreateAccountViewModel.validateCredentials: Error - \(String(describing: passwordError))") }
		if confirmPasswordError != nil { print("CreateAccountViewModel.validateCredentials: Error - \(String(describing: confirmPasswordError))") }
	}
	
}
