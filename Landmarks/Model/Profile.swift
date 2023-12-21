//
//  Profile.swift
//  Landmarks
//
//  Created by 周祥鹏 on 2024/1/18.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool = false
    var seasonalPhoto: Season = .winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        
        var id: String { rawValue }
    }
}
