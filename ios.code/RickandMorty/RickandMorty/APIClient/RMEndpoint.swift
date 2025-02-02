//
//  RMEndpoint.swift
//  RickandMorty
//
//  Created by A. Mallik on 03/07/2024.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
