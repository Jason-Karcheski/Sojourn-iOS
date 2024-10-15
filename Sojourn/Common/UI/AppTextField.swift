//
//  AppTextField.swift
//  Sojourn
//
//  Created by Jason Karcheski on 09/10/2024.
//

import Foundation
import SwiftUI

// TODO: Add KeyboardType parameter to get the correct keyboard for inputs! .keyboardType()

///
///	`AppTextField` provides a `TextField` or `SecureField` that uses the Sojourn Design System
///
///	- Parameters:
///		- text: A binding to the text value to be shown in the text field.
///		- hint: A `String` value that describes the expected content for the text field.
///		- errorMessage: An `Error`'s message that is related to this text field state.
///		- contentType: Describes the `UITextContentType` needed for this field.
///		- autoCapitalise: Sets the autocapitalise logic.
///
struct AppTextField: View {
	
	@Binding var text: String
	let hint: String
	var errorMessage: String?
	let contentType: UITextContentType?
	let keyboardType: UIKeyboardType
	let autoCapitalise: TextInputAutocapitalization?
	@FocusState private var focusState: Bool
	
	init(
		text: Binding<String>,
		hint: String.LocalizationValue,
		errorMessage: String? = nil,
		contentType: UITextContentType? = nil,
		keyboardType: UIKeyboardType = .default,
		autoCapitalise: TextInputAutocapitalization = .never
	) {
		self._text = text
		self.hint = String(localized: hint)
		self.errorMessage = errorMessage
		self.contentType = contentType
		self.keyboardType = keyboardType
		self.autoCapitalise = autoCapitalise
	}
	
	var body: some View {
		VStack(alignment: .leading) {
			inputField()
				.focused($focusState)
				.textContentType(contentType ?? .none)
				.keyboardType(keyboardType)
				.textInputAutocapitalization(autoCapitalise)
				.textFieldStyle(AppTextFieldStyle(isError: errorMessage != nil, isFocused: focusState))
			
			if let err = errorMessage {
				Text(err)
					.foregroundStyle(.red)
					.font(.caption)
					.padding(.horizontal)
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
	let isFocused: Bool
	private let highlightColour: Color
	private let cornerRadius = 8.0
	
	init(isError: Bool, isFocused: Bool) {
		self.isError = isError
		self.isFocused = isFocused
		self.highlightColour = isError ? .red : Color("AppPrimary")
	}
	
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding()
			.background(Color(UIColor.systemGray6))
			.clipShape(RoundedRectangle(cornerRadius: cornerRadius))
			.foregroundStyle(isError ? .red : Color("AppOnBackground"))
			.overlay {
				RoundedRectangle(cornerRadius: cornerRadius)
					.stroke(highlightColour, lineWidth: isError || isFocused ? 2.0 : 0.0)
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
