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
	
	let onNavigateBack: () -> Void
	
    var body: some View {
		AppScreen {
			AppTopBar(
				title: "Create Account",
				navigationAction: { onNavigateBack() }
			)
		} content: {
			AppTextField(text: $email, hint: "Email")
			AppTextField(text: $password, hint: "Password")
			AppTextField(text: $confirmPassword, hint: "Confirm password")
			
			Spacer()
			
			AppButton(label: "Continue") {
				// TODO: Add method to launch create account request
			}
		}

    }
}

#Preview {
	CreateAccountScreen(onNavigateBack: {})
}
