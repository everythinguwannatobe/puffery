import Foundation

public struct CreateUserRequest: Codable {
    public var device: CreateDeviceRequest?
    public var email: String?

    public init(device: CreateDeviceRequest?, email: String? = nil) {
        self.device = device
        self.email = email
    }
}

public struct UpdateProfileRequest: Codable {
    public var email: String?

    public init(email: String?) {
        self.email = email
    }
}

public struct LoginUserRequest: Codable {
    public var email: String

    public init(email: String) {
        self.email = email
    }
}

public struct CreateChannelRequest: Codable {
    public var title: String

    public init(title: String) {
        self.title = title
    }
}

public struct CreateSubscriptionRequest: Codable {
    public var receiveOrNotifyKey: String

    public init(receiveOrNotifyKey: String) {
        self.receiveOrNotifyKey = receiveOrNotifyKey
    }
}

public struct CreateMessageRequest: Codable {
    public var title: String
    public var body: String
    public var color: String?

    public init(title: String, body: String, color: String?) {
        self.title = title
        self.body = body
        self.color = color
    }
}

public struct CreateDeviceRequest: Codable {
    public var token: String
    public var isProduction: Bool?

    public init(token: String, isProduction: Bool? = nil) {
        self.token = token
        self.isProduction = isProduction
    }
}

public struct CreateOrUpdateDeviceRequest: Codable {
    public var isProduction: Bool?

    public init(isProduction: Bool? = nil) {
        self.isProduction = isProduction
    }
}
