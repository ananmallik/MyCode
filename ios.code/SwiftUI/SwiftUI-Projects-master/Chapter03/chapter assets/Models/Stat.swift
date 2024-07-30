//
//  Stat.swift
//  NBAWatchDraft WatchKit Extension
//
//  Created by Craig Clayton on 11/23/19.
//  Copyright © 2019 Cocoa Academy. All rights reserved.
//

import Foundation

struct Stat: Decodable, Identifiable  {
    let id = UUID()
    let value: String
    let name: String
}
