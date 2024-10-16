//
//  CreateAccountScreen.swift
//  Sojourn
//
//  Created by Jason Karcheski on 10/10/2024.
//

import SwiftUI

struct CreateAccountScreen: View {

	@State private var viewmodel = CreateAccountViewModel()
	let onNavigateBack: () -> Void
	let onNavigate: (Route, Bool) -> Void
	
    var body: some View {
		AppScreen {
			AppTopBar(
				title: "Create Account",
				navigationAction: { onNavigateBack() }
			)
		} content: {
			AppTextField(
				text: $viewmodel.email,
				hint: "Email",
				errorMessage: viewmodel.emailError?.message,
				contentType: .emailAddress,
				keyboardType: .emailAddress
			)
			
			AppTextField(
				text: $viewmodel.password,
				hint: "Password",
				errorMessage: viewmodel.passwordError?.message,
				contentType: .password
			)
			
			AppTextField(
				text: $viewmodel.confirmPassword,
				hint: "Confirm password",
				errorMessage: viewmodel.confirmPasswordError?.message,
				contentType: .password
			)
			
			Spacer()
			
			AppButton(label: "Continue") {
				viewmodel.createAccount {
					onNavigate(.dashboard, true)
				}
			}
		}

    }
}

#Preview {
	CreateAccountScreen(onNavigateBack: {}, onNavigate: { route, shouldClearPath in })
}
