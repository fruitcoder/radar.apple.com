# FB10425761 - Cannot preview widgets in watchOS 

- Take the Emoji Ranger Sample Project (https://developer.apple.com/documentation/widgetkit/adding_widgets_to_the_lock_screen_and_watch_faces)
- Select the CharacterDetailExtensionWatch target
- Select EmojiRangerWidget.swift or LeaderboardWidget.swift and activate previews
- The preview correctly recognizes the three widget previews to create (they appear as tabs on top) but fails to run the previews with an error RemoteHumanReadableError: Type 'WidgetEntryPointFactory' does not conform to `NonUIEntryPoint`

Expected Result: the watchOS widgets preview works

Workaround: I can’t get the previews to work (nor running the widget target on the simulator directly), I have to install the container app, run it and go to the home screen to see updates to my widget code
Expected: 

Attached preview crash report

https://openradar.appspot.com/radar?id=4934945260699648
