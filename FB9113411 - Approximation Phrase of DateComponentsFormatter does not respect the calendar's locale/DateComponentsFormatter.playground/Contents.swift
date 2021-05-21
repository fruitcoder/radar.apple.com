import Foundation

let dateComponentsFormatter = DateComponentsFormatter()
dateComponentsFormatter.calendar = Calendar(identifier: .hebrew)
dateComponentsFormatter.calendar?.locale = Locale(identifier: "de_DE")
dateComponentsFormatter.calendar?.timeZone = TimeZone(identifier: "Europe/Berlin")!

dateComponentsFormatter.includesApproximationPhrase = true
dateComponentsFormatter.unitsStyle = .full

let output = dateComponentsFormatter.string(from: 1_000)
