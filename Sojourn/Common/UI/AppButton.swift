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
	let state: AppButtonState
	let onPressed: () -> Void
	
	init(
		label: String.LocalizationValue,
		type: AppButtonType = .primary,
		state: AppButtonState = .enabled,
		onPressed: @escaping () -> Void
	) {
		self.label = String(localized: label)
		self.type = type
		self.state = state
		self.onPressed = onPressed
	}
	
	var body: some View {
		HStack {
			Button {
				onPressed()
			} label: {
				if state == .loading {
					ProgressView()
						.tint(type.labelColour)
				} else {
					Text(label.capitalized)
				}
			}
			.disabled(state != .enabled)
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
			Color("AppBackground")
		}
	}
	
	fileprivate var labelColour: Color {
		switch self {
		case .primary:
			Color("AppOnPrimary")
		case .secondary:
			Color("AppOnBackground")
		}
	}
	
	fileprivate var borderColour: Color {
		switch self {
		case .primary:
			Color.clear
		case .secondary:
			Color(.systemGray6)
		}
	}
}

///
/// `AppButtonState` defines the states which an `AppButton` can be in.
///
enum AppButtonState {
	case enabled, disabled, loading
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
			.foregroundStyle(configuration.isPressed ? type.labelColour.opacity(0.8) : type.labelColour)
			.clipShape(RoundedRectangle(cornerRadius: 16.0))
			.overlay {
				RoundedRectangle(cornerRadius: 16.0)
					.stroke(type.borderColour, lineWidth: 2.0)
			}
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
