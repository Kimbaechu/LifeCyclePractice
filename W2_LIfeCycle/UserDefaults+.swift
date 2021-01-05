//
//  UserDefaults+.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/05.
//

import Foundation

let groupID = "group.com.Kwonbeom.W2_LifeCycle"

extension UserDefaults {
    static var shared: UserDefaults {
        let appGroupId = groupID
        return UserDefaults(suiteName: appGroupId)!
    }
}
