// swift-tools-version: 5.6
import PackageDescription

// Current stable version of the Amazon Chime SDK for iOS
let SDKVersion = "0.27.4"
let SDKMediaVersion = "0.25.4"
let SDKMachineLearningVersion = "0.3.3"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKChecksum = "c964a9f4c1516c9d27b763eb86828509cd2125c90b24affcd774a98a270f23d1"
let SDKMediaChecksum = "fd2df3f5c2fd4718ba9a3ab67a0c9e7b2c1e1623b0e42dfd6f509dd89d775812"
let SDKMachineLearningChecksum = "ded8c2e93129edbe35f9bb12bd2a216dc8ff27887d58684a0d6a56063eddbeae"

let package = Package(
    name: "AmazonChimeSDK",
    products: [
        .library(name: "AmazonChimeSDK", targets: ["AmazonChimeSDK", "AmazonChimeSDKMedia"]),
        .library(name: "AmazonChimeSDKMedia", targets: ["AmazonChimeSDKMedia"]),
        .library(
            name: "AmazonChimeSDKMachineLearning",
            targets: [
                "AmazonChimeSDKMachineLearning",
                "AmazonChimeSDKMachineLearningCoreMLLinker"
            ]
        )
    ],
    targets: [
        .binaryTarget(
            name: "AmazonChimeSDK",
            url: "\(hostingUrl)/sdk/\(SDKVersion)/spm/AmazonChimeSDK-\(SDKVersion).zip",
            checksum: SDKChecksum
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMedia",
            url: "\(hostingUrl)/media/\(SDKMediaVersion)/spm/AmazonChimeSDKMedia-\(SDKMediaVersion).zip",
            checksum: SDKMediaChecksum
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMachineLearning",
            url: "\(hostingUrl)/machine-learning/\(SDKMachineLearningVersion)/spm/AmazonChimeSDKMachineLearning-\(SDKMachineLearningVersion).zip",
            checksum: SDKMachineLearningChecksum
        ),
        .target(
            name: "AmazonChimeSDKMachineLearningCoreMLLinker",
            dependencies: ["AmazonChimeSDKMachineLearning"],
            linkerSettings: [
                .linkedFramework("CoreML", .when(platforms: [.iOS]))
            ]
        )
    ]
)
