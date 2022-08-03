//
//  Text.swift
//  Kiitos
//
//  Created by Влад Руденко on 03.07.2022.
//

import UIKit

struct Text {
    let slova = ["Люблю Тебя❤️💙💜", "Спасибо Тебе💞", "Ты Самая Лучшая💟", "БрБрБрБрБрБрБр😘"]
    let notificationCenter = UNUserNotificationCenter.current()
    
    func notification() {
        
        //MARK: - Create the Notification's Content
        let contentNoti = UNMutableNotificationContent()
        contentNoti.title = "😘🦫"
        contentNoti.body = slova.randomElement()!
        contentNoti.sound = .default
        contentNoti.badge = 1
        contentNoti.categoryIdentifier = "KiitosVera"
        
        //MARK: - Specify the Conditios for Delivery
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
        dateComponents.hour = Int.random(in: 22...22)
        dateComponents.minute = Int.random(in: 09...09)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //MARK: - Create and Register a Notification Request
        let uudiString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uudiString, content: contentNoti, trigger: trigger)
        
        notificationCenter.add(request) { (error: Error?) in
            if error != nil {
                print("Text of error")
            }
        }
        
        //MARK: - For actions in Notifications
        let acceptAction = UNNotificationAction(identifier: "Onnea", title: "Onnea!", options: [])
        let meetingInviteCategory = UNNotificationCategory(identifier: "KiitosVera", actions: [acceptAction], intentIdentifiers: [], options: .customDismissAction)
        
        notificationCenter.setNotificationCategories([meetingInviteCategory])
    }
    
}
