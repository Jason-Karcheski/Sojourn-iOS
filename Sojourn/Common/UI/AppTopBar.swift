//
//  AppTopBar.swift
//  Sojourn
//
//  Created by Jason Karcheski on 10/10/2024.
//

import Foundation
import SwiftUI

///
/// `AppTopBar` provides a top bar that uses the Sojourn Design System.
///
/// - Parameters:
///		- title: The title value.
///		- subtitle: An optional subtitle value.
///
struct AppTopBar: View {
	
	let title: String
	let subtitle: String?
	
	init(title: String.LocalizationValue, subtitle: String.LocalizationValue? = nil) {
		self.title = String(localized: title)
		self.subtitle = (subtitle != nil) ? String(localized: subtitle!) : nil
	}
	
	var body: some View {
		HStack {
			VStack {
				Text(title.capitalized)
					.font(subtitle == nil ? .title3 : .subheadline)
					.bold()
				
				if let subtitle {
					Text(subtitle.capitalized)
						.font(.subheadline)
						.foregroundStyle(Color(UIColor.systemGray))
				}
			}
		}
		.padding()
		.frame(maxWidth: .infinity, minHeight: 70.0)
	}
}

// MARK: Previews

#Preview {
	VStack(spacing: 10) {
		AppTopBar(title: "App top bar preview")
		
		AppTopBar(
			title: "App top bar preview",
			subtitle: "Preview subtitle"
		)
	}
}
