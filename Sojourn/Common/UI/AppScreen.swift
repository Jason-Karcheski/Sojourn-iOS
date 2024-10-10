//
//  AppScreen.swift
//  Sojourn
//
//  Created by Jason Karcheski on 10/10/2024.
//

import Foundation
import SwiftUI

///
/// `AppScreen` provides a screen layout template that uses the Sojourn Design System.
///
/// - Parameters:
/// 	- topbar: An optional slot for a `AppTopBar`.
/// 	- content: A slot for the screen content.
///
struct AppScreen<Content: View>: View {
	
	let topbar: AppTopBar?
	let content: Content
	
	init(
		topbar: (() -> AppTopBar)? = nil,
		@ViewBuilder content: () -> Content
	) {
		self.topbar = topbar?()
		self.content = content()
	}
	
	var body: some View {
		VStack {
			topbar
			
			VStack {
				content.navigationBarBackButtonHidden()
			}
			.padding(.horizontal)
		}
		.frame(
			maxWidth: .infinity,
			maxHeight: .infinity,
			alignment: .top
		)
	}
}

// MARK: Previews

#Preview {
	AppScreen(
		topbar: { AppTopBar(title: "App screen preview", subtitle: "preview subtitle") },
		content: { Text("App screen preview content") }
	)
}
