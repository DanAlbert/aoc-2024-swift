// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "Advent2024",
  targets: [
    .target(name: "Advent"),
    .executableTarget(
      name: "Day1",
      dependencies: ["Advent"],
      resources: [.process("Resources")]
    ),
    .testTarget(
      name: "AdventTests",
      dependencies: ["Advent"],
      resources: [.process("Resources")]
    ),
    .testTarget(
      name: "Day1Tests",
      dependencies: ["Day1"]
    ),
  ]
)
