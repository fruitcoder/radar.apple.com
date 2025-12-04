# FB21259096 - iPadOS TabBar should allow customization of font and text colors

Since iPadOS 18 with the tab bar moving to the top of the screen it is not possible to customize the look of the tab bar anymore. This is a big visual clash especially with the ability to freely resize windows on iPadOS now. On horizontally compact windows we have a tab bar with our font and colors so it perfectly conforms to our CI but on horizontally regular windows all customization is lost and it’s the vanilla style looking like every other app. We’d love to get the ability for customization back. See the attached Xcode project to see that we tried setting the `UITabBarItemAppearance`’s `iconColor` and `titleTextAttributes` for selected and normal. This works as long as the tab bar is on the bottom.

https://openradar.appspot.com/radar?id=EhAKBVJhZGFyEICAgPqQ3_EJ
