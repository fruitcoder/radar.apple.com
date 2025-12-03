import SwiftUI

@main
struct iOS26TabItemIconColorApp: App {
	@State private var selection: Int = 0
	@State private var shouldUseWorkaround: Bool = false

	var body: some Scene {
		WindowGroup {
			TabView(selection: $selection) {
				Tab(value: 0) {
					Text("Tab 1")
					Toggle("Use Workaround", isOn: $shouldUseWorkaround)
				} label: {
					Label {
						Text("Title 1")
					} icon: {
						Image(systemName: "circle.fill")
					}
				}

				Tab(value: 1) {
					Text("Tab 2")
				} label: {
					Label {
						Text("Title 2")
					} icon: {
						if
							shouldUseWorkaround,
							selection != 1,
							let image = UIImage(systemName: "circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
						{
							Image(uiImage: image)
						} else {
							Image(systemName: "circle.fill")
						}
					}
				}
			}

			.onAppear {
				let tabBarAppeareance = UITabBarAppearance()
				tabBarAppeareance.configureWithTransparentBackground()

				let itemAppearance = UITabBarItemAppearance()
				itemAppearance.normal.iconColor = .red
				itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.red]

				itemAppearance.selected.iconColor = .green
				itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.green]

				// Apply to all layout appearances
				tabBarAppeareance.stackedLayoutAppearance = itemAppearance
				tabBarAppeareance.inlineLayoutAppearance = itemAppearance
				tabBarAppeareance.compactInlineLayoutAppearance = itemAppearance

				UITabBar.appearance().standardAppearance = tabBarAppeareance
				UITabBar.appearance().scrollEdgeAppearance = tabBarAppeareance
			}
		}
	}
}
