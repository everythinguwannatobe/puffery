#if !canImport(ObjectiveC)
    import XCTest

    extension HelloWorldTests {
        // DO NOT MODIFY: This is autogenerated, use:
        //   `swift test --generate-linuxmain`
        // to regenerate.
        static let __allTests__HelloWorldTests = [
            ("testHelloWorldSucceeds", testHelloWorldSucceeds),
        ]
    }

    extension RegistrationTests {
        // DO NOT MODIFY: This is autogenerated, use:
        //   `swift test --generate-linuxmain`
        // to regenerate.
        static let __allTests__RegistrationTests = [
            ("testBasicRegistration", testBasicRegistration),
            ("testRegistrationWithDeviceAndEmail", testRegistrationWithDeviceAndEmail),
            ("testRegistrationWithDevice", testRegistrationWithDevice),
            ("testRegistrationWithoutDeviceButEmail", testRegistrationWithoutDeviceButEmail),
        ]
    }

    extension SendMessageTests {
        // DO NOT MODIFY: This is autogenerated, use:
        //   `swift test --generate-linuxmain`
        // to regenerate.
        static let __allTests__SendMessageTests = [
            ("testPublicNotify", testPublicNotify),
            ("testPublicNotifyNotFound", testPublicNotifyNotFound),
        ]
    }

    public func __allTests() -> [XCTestCaseEntry] {
        [
            testCase(HelloWorldTests.__allTests__HelloWorldTests),
            testCase(RegistrationTests.__allTests__RegistrationTests),
            testCase(SendMessageTests.__allTests__SendMessageTests),
        ]
    }
#endif
