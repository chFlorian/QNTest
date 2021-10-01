//
//  ContentView.swift
//  QNTest
//
//  Created by florian schweizer on 01.10.21.
//

import SwiftUI

struct ContentView: View {
    @State var currentActivity: NSUserActivity? = nil
    @State var text = "Empty String"
    
    var body: some View {
        VStack {
            Text(text)
                .padding()
            
            Button("Start Activity") {
                startActivity()
            }
        }
        .onContinueUserActivity("fschweizer.QNTest.DummyActivity") { activity in
            if let userInfo = activity.userInfo,
               let helloString = userInfo["hello"] as? String {
                text = helloString
            }
        }
        .onDisappear {
            stopActivity()
        }
    }
    
    func startActivity() {
        let activity = NSUserActivity(activityType: "fschweizer.QNTest.DummyActivity")
        activity.title = "You're doing a dummy activity."
        activity.persistentIdentifier = "DummyActivity"
        
        activity.userInfo = ["hello": "world"]
        
        currentActivity = activity
        currentActivity?.becomeCurrent()
    }
    
    func stopActivity() {
        currentActivity?.resignCurrent()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
