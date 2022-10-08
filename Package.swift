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
    .library(
      name: "TextureAtlasAsset",
      targets: ["TextureAtlasAsset"]),
  ],
  dependencies: [
    .package(url: "https://github.com/nicolas-miari/CompositeImageAsset.git", from: "1.0.1"),
    .package(url: "https://github.com/nicolas-miari/UniqueIdentifierProvider.git", from: "0.0.1"),
  ],
  targets: [
    .target(
      name: "TextureAtlasAsset",
      dependencies: [
        .product(name: "CompositeImageAsset", package: "CompositeImageAsset"),
        .product(name: "UniqueIdentifierProvider", package: "UniqueIdentifierProvider"),
      ]),
    .testTarget(
      name: "TextureAtlasAssetTests",
      dependencies: ["TextureAtlasAsset"]),
  ]
)
