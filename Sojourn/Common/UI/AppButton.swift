//
//  AppButton.swift
//  Sojourn
//
//  Created by Jason Karcheski on 10/10/2024.
//

import Foundation
import SwiftUI

///
/// `AppButton` provides a `Button` view that uses the Sojourn Design System.
///
/// - Parameters:
/// 	- label: The text to be shown in the button.
/// 	- type: The type of button that will be rendered.
/// 	- onPressed: A method that is run when the button is pressed.
///
struct AppButton: View {
	
	let label: String
	let type: AppButtonType
	let onPressed: () -> Void
	
	init(
		label: String.LocalizationValue,
		type: AppButtonType = .primary,
		onPressed: @escaping () -> Void
	) {
		self.label = String(localized: label)
		self.type = type
		self.onPressed = onPressed
	}
	
	var body: some View {
		HStack {
			Button {
				onPressed()
			} label: {
				Text(label.capitalized)
			}
			.buttonStyle(AppButtonStyle(type: type))
		}
	}
}

// MARK: Supporting Code

///
/// `AppButtonType` defines a set of button types inline with the Sojourn Design System.
///
enum AppButtonType {
	case primary, secondary
	
	fileprivate var backgroundColour: Color {
		switch self {
		case .primary:
			Color("AppPrimary")
		case .secondary:
			Color.black
		}
	}
	
	fileprivate var labelColour: Color {
		switch self {
		case .primary:
			Color("AppOnPrimary")
		case .secondary:
			Color.white
		}
	}
}

///
/// `AppButtonStyle` defines the style for `AppButton`.
///
fileprivate struct AppButtonStyle: ButtonStyle {
	
	let type: AppButtonType
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding()
			.frame(maxWidth: .infinity)
			.background(configuration.isPressed ? type.backgroundColour.opacity(0.8) : type.backgroundColour)
			.foregroundStyle(type.labelColour)
			.clipShape(RoundedRectangle(cornerRadius: 16.0))
			.scaleEffect(configuration.isPressed ? CGFloat(0.97) : CGFloat(1.0))
	}
}

// MARK: Previews

#Preview {
	VStack(spacing: 10) {
		AppButton(label: "App button preview", onPressed: {})
		AppButton(label: "App button preview", type: .secondary, onPressed: {})
	}
	.padding()
}
