import Fluent
import Vapor

final class Subscription: Model {
    static let schema = "subscriptions"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: User
    @Parent(key: "channel_id")
    var channel: Channel
    @Field(key: "can_notify")
    var canNotify: Bool

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(id: UUID? = nil, user: User, channel: Channel, canNotify: Bool) throws {
        self.id = id
        $user.id = try user.requireID()
        $user.value = user
        $channel.id = try channel.requireID()
        $channel.value = channel
        self.canNotify = canNotify
    }
}
