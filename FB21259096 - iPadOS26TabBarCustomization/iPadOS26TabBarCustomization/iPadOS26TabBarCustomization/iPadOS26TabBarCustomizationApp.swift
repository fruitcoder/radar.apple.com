import SwiftUI

@main
struct iPadOS26TabBarCustomizationApp: App {
	@State private var selection: Int = 0

	var body: some Scene {
		WindowGroup {
			TabView(selection: $selection) {
				Tab(value: 0) {
					Text(
						AttributedString(
							NSAttributedString(string: "Test String", attributes: textAttributes)
						)
					)
				} label: {
					Label {
						Text("Title 1")
					} icon: {
						Image(systemName: "circle.fill")
					}
				}

				Tab(value: 1) {
					Text(
						AttributedString(
							NSAttributedString(string: "Test String 2", attributes: textAttributes)
						)
					)
				} label: {
					Label {
						Text("Title 2")
					} icon: {
						Image(systemName: "circle.fill")
					}
				}
			}

			.onAppear {
				let tabBarAppeareance = UITabBarAppearance()
				tabBarAppeareance.configureWithDefaultBackground()

				let itemAppearance = UITabBarItemAppearance()
				itemAppearance.normal.iconColor = .red
				itemAppearance.normal.titleTextAttributes = [
					.foregroundColor: UIColor.red
				]

				itemAppearance.selected.iconColor = .green
				itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.green]

				tabBarAppeareance.stackedLayoutAppearance = itemAppearance
				tabBarAppeareance.inlineLayoutAppearance = itemAppearance
				tabBarAppeareance.compactInlineLayoutAppearance = itemAppearance

				UITabBar.appearance().standardAppearance = tabBarAppeareance
				UITabBar.appearance().scrollEdgeAppearance = tabBarAppeareance
			}
			.accentColor(.green) // The only thing that works
		}
	}

	let textAttributes: [NSAttributedString.Key: Any] = [
		.foregroundColor: UIColor.red,
		.font: UIFont(name: "Georgia", size: 20)!
	]

}
