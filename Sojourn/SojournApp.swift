//
//  SojournApp.swift
//  Sojourn
//
//  Created by Jason Karcheski on 09/10/2024.
//

import SwiftUI
import FirebaseCore

@main
struct SojournApp: App {

	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	@State private var path: NavigationPath = NavigationPath([Route.signIn])
	
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

class AppDelegate : NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()
		return true
	}
}
