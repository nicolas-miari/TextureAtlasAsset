// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "TextureAtlasAsset",
  platforms: [
    .iOS(.v15),
    .macOS(.v11)
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "TextureAtlasAsset",
      targets: ["TextureAtlasAsset"]),
  ],
  dependencies: [
    .package(url: "https://github.com/nicolas-miari/Asset.git", from: "1.0.2"),
    .package(url: "https://github.com/nicolas-miari/ImageAsset.git", from: "1.0.2"),
    .package(url: "https://github.com/nicolas-miari/UniqueIdentifierProvider.git", from: "0.0.1"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "TextureAtlasAsset",
      dependencies: [
        .product(name: "Asset", package: "Asset"), // NEEDED?
        .product(name: "ImageAsset", package: "ImageAsset"),
        .product(name: "UniqueIdentifierProvider", package: "UniqueIdentifierProvider"),
      ]),
    .testTarget(
      name: "TextureAtlasAssetTests",
      dependencies: ["TextureAtlasAsset"]),
  ]
)
