//
//  NavigationPathExtensions.swift
//  Sojourn
//
//  Created by Jason Karcheski on 10/10/2024.
//

import Foundation
import SwiftUI

extension NavigationPath {
	
	/// Navigate to a specified `Route`.
	///
	/// - Parameters:
	/// 	- route: The destination to navigate to.
	mutating func navigateToRoute(_ route: Route, shouldClearPath: Bool = false) {
		if shouldClearPath { self.removeLast(self.count) }
		self.append(route)
	}
	
	/// Navigate back to the previous `Route`.
	/// If the `NavigationPath` is empty then nothing will happen.
	mutating func navigateBack() {
		if !self.isEmpty { self.removeLast() }
	}
	
	/// Navigate to a starting destination
	mutating func navigateToStartingScreen() {
		let authManager = AuthenticationManager()
		let route = authManager.currentUser() == nil ? Route.signIn : Route.dashboard
		self.append(route)
	}
	
}
