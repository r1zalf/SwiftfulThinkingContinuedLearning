//
//  LocalNotificationsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 28/01/24.
//

import SwiftUI
import MapKit

class  LocalNotificationsManager {
    static let shared =  LocalNotificationsManager()
    
    
    func requstPermission() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { _, error in
            if let error = error {
                print("ERROR \(error.localizedDescription)")
            } else {
                print("SUCESS")
            }
        }
    }
    
    // TIme
    // Calendar
    // Locations
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Sample notif rizal title"
        content.subtitle = "Sample notif rizal subtile"
        content.sound = .default
        content.badge = 1
        
        // time
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calendar
//        var dateComponent = DateComponents()
//        dateComponent.hour = 2
//        dateComponent.minute = 23
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        // location
//        let location = CLLocationCoordinate2DMake(40.00, 70.00)
//        let region = CLCircularRegion(center: location, radius: 100, identifier: UUID().uuidString)
//        region.notifyOnExit = false
//        region.notifyOnEntry = true
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: false)
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
}
struct LocalNotificationsBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("Request permission") {
                LocalNotificationsManager.shared.requstPermission()
            }
            
            Button("Send notification") {
                LocalNotificationsManager.shared.sendNotification()
            }
        }
        .onAppear {
//            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    LocalNotificationsBootcamp()
}
