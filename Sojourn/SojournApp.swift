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
					.navigationDestination(for: Route.self) { route in
						destinationScreen(route)
					}
					.onChange(of: path) { _, newValue in
						print(String(describing: newValue))
						if newValue.isEmpty {
							path.navigateToStartingScreen()
						}
					}
			}
        }
    }
	
	@ViewBuilder
	private func destinationScreen(_ route: Route) -> some View {
		switch route {
		case .createAccount:
			CreateAccountScreen(onNavigateBack: { path.navigateBack() })
		case .dashboard:
			Text("Dashboard")
		case .signIn:
			SignInScreen(onNavigate: { route, shouldClearPath in
				if shouldClearPath { path.removeLast(path.count) }
				path.navigateToRoute(route)
			})
		}
	}
}

class AppDelegate : NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()
		return true
	}
}
