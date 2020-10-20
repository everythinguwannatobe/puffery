import WidgetKit
import PufferyKit

struct MessageEntry: TimelineEntry {
    let message: Message?
    let configuration: ChannelWidgetsIntent

    var date: Date {
        if let message = message {
            return Date(timeIntervalSinceNow: min(3600, -1 * message.createdAt.timeIntervalSinceNow))
        } else {
            return Date(timeIntervalSinceNow: 60)
        }
    }
}
