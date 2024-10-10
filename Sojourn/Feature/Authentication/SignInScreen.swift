//
//  SignInScreen.swift
//  Sojourn
//
//  Created by Jason Karcheski on 10/10/2024.
//

import Foundation
import SwiftUI

struct SignInScreen: View {
	
	@State private var email: String = ""
	@State private var password: String = ""
	
	let navigateToCreateAccount: () -> Void
	
	var body: some View {
		AppScreen {
			AppTopBar(title: "Sign In")
		} content: {
			AppTextField(
				text: $email,
				hint: "Email",
				contentType: .emailAddress
			)
				
			AppTextField(
				text: $password,
				hint: "Password",
				contentType: .password
			)
			
			Spacer()
			
			HStack {
				AppButton(
					label: "Create Account",
					type: .secondary,
					onPressed: { navigateToCreateAccount() }
				)
				
				AppButton(
					label: "Sign In",
					onPressed: {}
				)
			}
		}
	}
	
}

// MARK: Previews

#Preview {
	SignInScreen(navigateToCreateAccount: {})
}
