//
//  SignInScreen.swift
//  Sojourn
//
//  Created by Jason Karcheski on 10/10/2024.
//

import Foundation
import SwiftUI

struct SignInScreen: View {
	
	@State private var viewmodel: SignInViewModel
	private let onNavigate: (Route, Bool) -> Void
	
	init(
		viewmodel: SignInViewModel = SignInViewModel(),
		onNavigate: @escaping (Route, Bool) -> Void
	) {
		self.viewmodel = viewmodel
		self.onNavigate = onNavigate
	}
	
	var body: some View {
		AppScreen {
			AppTopBar(title: "Sign In")
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
			
			Spacer()
			
			HStack {
				AppButton(
					label: "Create Account",
					type: .secondary,
					onPressed: { onNavigate(.createAccount, false) }
				)
				
				AppButton(
					label: "Sign In",
					onPressed: {
						viewmodel.signIn { onNavigate(.dashboard, true) }
					}
				)
			}
		}
	}
	
}

// MARK: Previews

#Preview {
	SignInScreen(onNavigate: { route, clearPath in })
}
