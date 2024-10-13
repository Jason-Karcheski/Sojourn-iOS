//
//  CreateAccountScreen.swift
//  Sojourn
//
//  Created by Jason Karcheski on 10/10/2024.
//

import SwiftUI

struct CreateAccountScreen: View {
	
	@State private var email: String = ""
	@State private var password: String = ""
	@State private var confirmPassword: String = ""
	
	private let viewmodel = CreateAccountViewModel()
	let onNavigateBack: () -> Void
	
    var body: some View {
		AppScreen {
			AppTopBar(
				title: "Create Account",
				navigationAction: { onNavigateBack() }
			)
		} content: {
			AppTextField(
				text: $email, 
				hint: "Email",
				contentType: .emailAddress,
				keyboardType: .emailAddress
			)
			
			AppTextField(
				text: $password,
				hint: "Password",
				contentType: .password
			)
			
			AppTextField(
				text: $confirmPassword,
				hint: "Confirm password",
				contentType: .password
			)
			
			Spacer()
			
			AppButton(label: "Continue") {
				viewmodel.createAccount(email: email, password: password)
			}
		}

    }
}

#Preview {
	CreateAccountScreen(onNavigateBack: {})
}
