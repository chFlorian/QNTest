# QNTest - QuickNote for iPad

1. Add NSUserActivityTypes to the app's Info.plist
2. Set currently active NSUserActivity when the user starts a specific activity:
```swift
func startActivity() {
    let activity = NSUserActivity(activityType: "fschweizer.QNTest.DummyActivity")
    activity.title = "Learn more about Quick Note"
    
    activity.persistentIdentifier = "ViewHomeScreen"
    
    activity.userInfo = ["hello": "world", "test": 2]
    
    currentActivity = activity
    currentActivity?.becomeCurrent()
}
```
3. Resign NSUserActivity once it is over (or replace with another NSUserActivity)
```swift
func stopActivity() {
    currentActivity?.resignCurrent()
}
```
6. Listen to the continuation of an NSUserActivity on a SwiftUI View:
```swift
.onContinueUserActivity("fschweizer.QNTest.DummyActivity") { userActivity in
    if let userInfo = userActivity.userInfo,
       let hello = userInfo["hello"] as? String,
       let test = userInfo["test"] as? Int {
        print("hello \(hello)")
        print("test \(test)")
    }
}
```

