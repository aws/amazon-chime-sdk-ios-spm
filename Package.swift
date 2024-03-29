// swift-tools-version: 5.6
import PackageDescription

// Current stable version of the Amazon Chime SDK for iOS
let SDKVersion = "0.25.0"
let SDKMediaVersion = "0.20.0"
let SDKMachineLearningVersion = "0.3.0"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKChecksum = "06635de26c5fcb48841e489774a550db4f87e4bd76077b919b24fd735f82fa6c"
let SDKMediaChecksum = "85f0b56c01a99d87e6f8f9198a9016f1adde93867fa53234da4db0e4efcca36d"
let SDKMachineLearningChecksum = "9f38aef436f9dcdcf2687ed35b6c72cbbd495d3ae1ef1f97d4f53bd0c2f974e1"

let package = Package(
    name: "AmazonChimeSDK",
    products: [
        .library(name: "AmazonChimeSDK", targets: ["AmazonChimeSDK", "AmazonChimeSDKMedia"]),
        .library(name: "AmazonChimeSDKMedia", targets: ["AmazonChimeSDKMedia"]),
        .library(name: "AmazonChimeSDKMachineLearning", targets: ["AmazonChimeSDKMachineLearning"])
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
        )
    ]
)
