//
//  SojournApp.swift
//  Sojourn
//
//  Created by Jason Karcheski on 09/10/2024.
//

import SwiftUI

@main
struct SojournApp: App {
	
	@State private var path = NavigationPath()
	
    var body: some Scene {
        WindowGroup {
			NavigationStack(path: $path) {
				ProgressView()
					.frame(
						minWidth: .infinity,
						minHeight: .infinity,
						alignment: .center
					)
					.navigationDestination(for: Route.self) { route in
						destinationScreen(route)
					}
			}
			.onAppear {
				path.navigateToRoute(.signIn)
			}
        }
    }
	
	@ViewBuilder
	private func destinationScreen(_ route: Route) -> some View {
		switch route {
		case .signIn:
			SignInScreen(navigateToCreateAccount: { path.navigateToRoute(.createAccount) })
		case .createAccount:
			CreateAccountScreen(onNavigateBack: { path.navigateBack() })
		}
	}
}
