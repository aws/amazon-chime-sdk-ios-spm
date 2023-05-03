// swift-tools-version: 5.6
import PackageDescription

// Current stable version of the Amazon Chime SDK for iOS
let SDKVersion = "0.23.0"
let SDKMediaVersion = "0.18.0"
let SDKMachineLearningVersion = "0.2.0"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// TODO: Update checksums during the first release
// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKChecksum = "SHA256_CHECKSUM_PLACEHOLDER"
let SDKMediaChecksum = "SHA256_CHECKSUM_PLACEHOLDER"
let SDKMachineLearningChecksum = "SHA256_CHECKSUM_PLACEHOLDER"

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
            url: "\(hostingUrl)/sdk-without-bitcode/\(SDKVersion)/spm/AmazonChimeSDK-\(SDKVersion).zip",
            checksum: SDKChecksum
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMedia",
            url: "\(hostingUrl)/media-without-bitcode/\(SDKMediaVersion)/spm/AmazonChimeSDKMedia-\(SDKMediaVersion).zip",
            checksum: SDKMediaChecksum
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMachineLearning",
            url: "\(hostingUrl)/machine-learning-without-bitcode/\(SDKMachineLearningVersion)/spm/AmazonChimeSDKMachineLearning-\(SDKMachineLearningVersion).zip",
            checksum: SDKMachineLearningChecksum
        )
    ]
)
