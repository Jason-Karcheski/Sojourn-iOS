//
//  ValidationError.swift
//  Sojourn
//
//  Created by Jason Karcheski on 16/10/2024.
//

import Foundation

enum ValidationError: Error {
	case emailEmpty, emailInvalid, passwordEmpty, passwordShort, passwordInvalid, passwordsDoNotMatch
	
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
		case .passwordsDoNotMatch:
			"Passwords need to match"
		}
	}
}
