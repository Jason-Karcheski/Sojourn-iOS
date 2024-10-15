//
//  StringExtensions.swift
//  Sojourn
//
//  Created by Jason Karcheski on 15/10/2024.
//

import Foundation

extension String {
	
	/// Validate that a string is an email address.
	func isValidEmail() -> ValidationError? {
		guard !self.isEmpty else { return .emailEmpty }
		
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailPredicate.evaluate(with: self) ? nil : .emailInvalid
	}
	
	/// Validate that a string follows password rules.
	func isValidPassword() -> ValidationError? {
		guard !self.isEmpty else { return .passwordEmpty }
		guard self.count >= 8 else { return .passwordShort }
		
		return nil
		// TODO: Figure out why this says "Password1!" is invalid - "SELF CONTAINS %@" causing the issue?
//		let specialCharacterRegEx = "[$&+,:;=?@#|'<>.-^*()%!]"
//		let specialCharacterPredicate = NSPredicate(format: "SELF CONTAINS %@", specialCharacterRegEx)
//		return specialCharacterPredicate.evaluate(with: self) ? nil : .passwordInvalid
	}
	
}
