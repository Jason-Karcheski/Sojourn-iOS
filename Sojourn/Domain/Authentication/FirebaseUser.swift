//
//  FirebaseUser.swift
//  Sojourn
//
//  Created by Jason Karcheski on 14/10/2024.
//

import Foundation
import FirebaseAuth

struct FirebaseUser {
	let uid: String
	let email: String?
	
	init(user: User) {
		self.uid = user.uid
		self.email = user.email
	}
}
