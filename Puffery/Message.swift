//
//  Message.swift
//  Puffery
//
//  Created by Valentin Knabel on 19.04.20.
//  Copyright © 2020 Valentin Knabel. All rights reserved.
//

import Foundation

typealias Message = MessageResponse

extension Message: Identifiable {
    var color: Color {
        colorName.flatMap(Color.init(rawValue:)) ?? .unspecified
    }

    enum Color: String, Codable {
        case blue, orange, green, red, gray

        static var unspecified: Color {
            .gray
        }
    }
}

#if DEBUG
    extension Message {
        static var testflight: Message {
            Message(
                id: UUID(),
                title: "New TestFlight version available",
                body: "Version 123 has been build",
                colorName: "orange",
                channel: UUID(),
                createdAt: Date()
            )
        }

        static var dockerImage: Message {
            Message(
                id: UUID(),
                title: "New Docker image pushed",
                body: "Version 123 has been build",
                colorName: "blue",
                channel: UUID(),
                createdAt: Date()
            )
        }
    }
#endif
