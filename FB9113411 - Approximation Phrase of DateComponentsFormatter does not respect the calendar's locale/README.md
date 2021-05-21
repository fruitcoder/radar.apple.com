# FB9113411 - Approximation Phrase of DateComponentsFormatter does not respect the calendar's locale

The `DateComponentsFormatter`’s behavior can be changed by setting a different calendar. To also change the locale we can set a different locale on the provided calendar. This is mostly respected by the formatter but when setting `includesApproximationPhrase = true` the approximation phrase uses the system’s current locale. 

Sample code (see attached Playground):

```swift
let dateComponentsFormatter = DateComponentsFormatter()
dateComponentsFormatter.calendar = Calendar(identifier: .gregorian)
dateComponentsFormatter.calendar?.locale = Locale(identifier: "de_DE")

dateComponentsFormatter.includesApproximationPhrase = true
dateComponentsFormatter.unitsStyle = .full

let output = dateComponentsFormatter.string(from: 1_000)
```

Expected: 
“Ungefähr 16 Minuten und 40 Sekunden"

Actual:
"About 16 Minuten und 40 Sekunden"

Suggestion:
To not break backwards compatibility for developers who don’t use the abbreviation the formatter should always use the calendar’s locale for localized String lookups (just like it does for he components). 

https://openradar.appspot.com/radar?id=4934945260699648
