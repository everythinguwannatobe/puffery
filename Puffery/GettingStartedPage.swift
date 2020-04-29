//
//  GettingStartedPage.swift
//  Puffery
//
//  Created by Valentin Knabel on 19.04.20.
//  Copyright © 2020 Valentin Knabel. All rights reserved.
//

import SwiftUI
import UserNotifications

struct GettingStartedPage: View {
    var onFinish: () -> Void

    @State var registrationInProgress = false
    @State var registrationError: FetchingError?

    var body: some View {
        VStack {
            Button(action: registerForPushNotifications) {
                Text("Register anonymously")
            }.disabled(registrationInProgress).onAppear { Current.tracker.record("GettingStartedPage") }
                .alert(item: $registrationError) { error in
                    Alert(title: Text("Registration failed"), message: Text(error.localizedDescription))
                }
            LoginView(onFinish: onFinish)
        }
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
//        }
    }

    func registerForPushNotifications() {
        registrationError = nil
        registrationInProgress = true

        PushNotifications.register {
            let createDeviceRequest = Current.store.state.session.latestDeviceToken.map {
                CreateDeviceRequest(token: $0)
            }
            Current.api.register(user: CreateUserRequest(device: createDeviceRequest)).task { result in
                switch result {
                case .success:
                    self.registrationError = nil
                    DispatchQueue.main.async {
                        self.onFinish()
                    }
                case let .failure(error):
                    self.registrationInProgress = false
                    self.registrationError = error
                }
            }
        }
    }
}

#if DEBUG
    struct GettingStarted_Previews: PreviewProvider {
        static var previews: some View {
            GettingStartedPage(onFinish: {})
        }
    }
#endif
