//
//  AppTextField.swift
//  Sojourn
//
//  Created by Jason Karcheski on 09/10/2024.
//

import Foundation
import SwiftUI

///
///	`AppTextField` provides a `TextField` or `SecureField` that uses the Sojourn Design System
///
///	- Parameters:
///		- text: A binding to the text value to be shown in the text field.
///		- hint: A `String` value that describes the expected content for the text field.
///		- error: An `Error` that is related to this text field state.
///		- contentType: Describes the `UITextContentType` needed for this field.
///		- autoCapitalise: Sets the autocapitalise logic.
///
struct AppTextField: View {
	
	@Binding var text: String
	let hint: String
	let error: Error?
	let contentType: UITextContentType?
	let autoCapitalise: TextInputAutocapitalization?
	
	init(
		text: Binding<String>,
		hint: String.LocalizationValue,
		error: Error? = nil,
		contentType: UITextContentType? = nil,
		autoCapitalise: TextInputAutocapitalization? = nil
	) {
		self._text = text
		self.hint = String(localized: hint)
		self.error = error
		self.contentType = contentType
		self.autoCapitalise = autoCapitalise
	}
	
	var body: some View {
		VStack {
			inputField()
				.textContentType(contentType ?? .none)
				.textInputAutocapitalization(autoCapitalise)
				.textFieldStyle(AppTextFieldStyle(isError: error != nil))
			
			if let err = error {
				Text(err.localizedDescription)
					.foregroundStyle(.red)
					.font(.caption)
			}
		}
	}
	
	@ViewBuilder
	private func inputField() -> some View {
		switch contentType {
		case .password, .newPassword:
			SecureField(hint, text: $text)
		default:
			TextField(hint, text: $text)
		}
	}
	
}

// MARK: Styles

fileprivate struct AppTextFieldStyle: TextFieldStyle {
	
	let isError: Bool
	private let highlightColour: Color
	private let cornerRadius = 8.0
	
	init(isError: Bool) {
		self.isError = isError
		self.highlightColour = isError ? .red : .blue
	}
	
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding()
			.background(Color(UIColor.systemGray6))
			.clipShape(RoundedRectangle(cornerRadius: cornerRadius))
			.foregroundStyle(isError ? .red : .black)
			.overlay {
				RoundedRectangle(cornerRadius: cornerRadius)
					.stroke(highlightColour, lineWidth: isError ? 2.0 : 0.0)
			}
	}
}

// MARK: Preview

#Preview {
	VStack(spacing: 10) {
		AppTextField(text: .constant(""), hint: "App text field preview")
		AppTextField(text: .constant("App text field preview"), hint: "")
		AppTextField(text: .constant("App text field preview"), hint: "", contentType: .password)
	}
	.padding()
}
