// swift-tools-version:5.2
// The swift-tools-version declares the minimum version
// of Swift required to build this package.
// ----------------------------------------------------
//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//  Documentation
//  https://jessesquires.github.io/PresenterKit
//
//  GitHub
//  https://github.com/jessesquires/PresenterKit
//
//  Copyright © 2020-present Jesse Squires
//

import PackageDescription

let package = Package(
    name: "PresenterKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "PresenterKit",
            targets: ["PresenterKit"])
    ],
    targets: [
        .target(
            name: "PresenterKit",
            path: "Sources"),
        .testTarget(name: "PresenterKitTests",
                    dependencies: ["PresenterKit"],
                    path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)
