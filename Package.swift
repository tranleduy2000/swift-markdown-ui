// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "swift-markdown-ui",
  platforms: [
    .macOS(.v13),
    .iOS(.v14),
    .tvOS(.v14),
    .macCatalyst(.v14),
    .watchOS(.v8),
  ],
  products: [
    .library(
      name: "MarkdownUI",
      targets: ["MarkdownUI"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/gonzalezreal/NetworkImage", from: "6.0.0"),
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.10.0"),
    .package(url: "https://github.com/swiftlang/swift-cmark", from: "0.4.0"),
    .package(url: "https://github.com/tranleduy2000/LaTeXSwiftUI.git", revision: "a0406a3caa68c9589127eca058fac44c181db31c"),
    //.package(path: "../LaTeXSwiftUI"),
  ],
  targets: [
    .target(
      name: "MarkdownUI",
      dependencies: [
        .product(name: "cmark-gfm", package: "swift-cmark"),
        .product(name: "cmark-gfm-extensions", package: "swift-cmark"),
        .product(name: "NetworkImage", package: "NetworkImage"),
        .product(name: "LaTeXSwiftUI", package: "LaTeXSwiftUI"),
      ]
    ),
    .testTarget(
      name: "MarkdownUITests",
      dependencies: [
        "MarkdownUI",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ],
      exclude: ["__Snapshots__"]
    ),
  ]
)
