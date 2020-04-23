//
//  AcknowledgementsPage.swift
//  Puffery
//
//  Created by Valentin Knabel on 19.04.20.
//  Copyright © 2020 Valentin Knabel. All rights reserved.
//

import SwiftUI

struct AcknowledgementsPage: View {
    var assets: [FlaticonAsset]
    var licenses: [License]

    var body: some View {
        List {
            Section(header: Text("Assets")) {
                ForEach(assets) { asset in
                    NavigationLink(destination: FlaticonAssetPage(asset: asset)) {
                        HStack {
                            Image(asset.name)

                            VStack(alignment: .leading) {
                                Text(asset.name)
                                Text("made by \(asset.author) from www.flaticon.com")
                                    .font(.footnote)
                            }
                        }
                    }
                }
            }.show(when: !assets.isEmpty)

            Section(header: Text("Code")) {
                ForEach(licenses) { license in
                    NavigationLink(destination: LicensePage(license: license)) {
                        Text(license.name)
                    }
                }
            }.show(when: !licenses.isEmpty)
        }.roundedListStyle()
            .navigationBarTitle("Acknowledgements", displayMode: .inline)
    }

    func openAssetDetails(_ asset: FlaticonAsset) {
        UIApplication.shared.open(asset.source)
    }
}

extension AcknowledgementsPage {
    init() {
        assets = FlaticonAsset.assets
        licenses = License.licenses
    }
}

struct LicensePage: View {
    var license: License

    var body: some View {
        VStack {
            ScrollView {
                Text(license.licenseText)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .padding()
                Spacer()
            }
        }
        .navigationBarItems(trailing: Button(action: openLicense) {
            Image(systemName: "safari").padding()
            })
        .navigationBarTitle("\(license.name)", displayMode: .inline)
    }

    func openLicense() {
        UIApplication.shared.open(license.source)
    }
}

struct FlaticonAssetPage: View {
    var asset: FlaticonAsset

    var body: some View {
        VStack {
            Image(asset.name)
            Text("Icon made by Freepik from www.flaticon.com").navigationBarItems(trailing: Button(action: openLicense) {
                Image(systemName: "safari").padding()
            })
        }
        .navigationBarTitle("\(asset.name)", displayMode: .inline)
    }

    func openLicense() {
        UIApplication.shared.open(asset.source)
    }
}

#if DEBUG
    struct AcknowledgementsPage_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                AcknowledgementsPage()
            }
        }
    }
#endif
