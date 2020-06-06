//
//  Aws.swift
//  SmartHome
//
//  Created by jeff on 2020/06/05.
//  Copyright © 2020 TakHyun Jung. All rights reserved.
//

import Foundation

// MARK: - Aws
struct AwsJson: Codable {
    let state: State
}

// MARK: - State
struct State: Codable {
    let reported: Reported
}

// MARK: - Reported
struct Reported: Codable {
    let temperature, humidity, roomlamp, door: String
    let fan, fanspeed: String
}
