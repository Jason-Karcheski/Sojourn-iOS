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
	mutating func navigateToRoute(_ route: Route) {
		self.append(route)
	}
	
	/// Navigate back to the previous `Route`.
	/// If the `NavigationPath` is empty then nothing will happen.
	mutating func navigateBack() {
		if !self.isEmpty { self.removeLast() }
	}
	
}
