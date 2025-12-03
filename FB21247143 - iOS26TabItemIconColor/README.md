# FB21247143 - TabView ignores unselected icon color 

iOS 26 ignores custom colors for unselected tab bar item icons. Previous implementations have no effect (while the text color still works).

Overwrite the item appearance 

```
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
```

Expected behavior:
Icons and text are tinted in red

Actual behavior:
Icons are use the default unselected tint color
Text is red

Workaround:
Pipe the image through UIImage and tint it using `withTintColor(<color>, renderingMode: .alwaysOriginal)`

https://openradar.me/radar?id=EhAKBVJhZGFyEICAgKab5fYJ
