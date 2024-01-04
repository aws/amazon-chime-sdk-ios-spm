// swift-tools-version: 5.6
import PackageDescription

// Current stable version of the Amazon Chime SDK for iOS
let SDKVersion = "0.24.0"
let SDKMediaVersion = "0.19.0"
let SDKMachineLearningVersion = "0.2.0"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKChecksum = "dda0102e6cbd21cb5b414178c9d14def9819a76702e047a0cd46fdb4782fc00b"
let SDKMediaNoVideoCodecsChecksum = "47d9599cc66919a1fcb2a13631b0368f4c8a6012792f5edfc1bdaeb9f8e89fb0"
let SDKMachineLearningChecksum = "d79e15d11b24ee53219a0c02963e60c4b56cd2f4d121bf8d40c3fe3068a14a9d"

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
            url: "\(hostingUrl)/media-no-video-codecs-without-bitcode/\(SDKMediaVersion)/spm/AmazonChimeSDKMediaNoVideoCodecs-\(SDKMediaVersion).zip",
            checksum: SDKMediaNoVideoCodecsChecksum
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMachineLearning",
            url: "\(hostingUrl)/machine-learning-without-bitcode/\(SDKMachineLearningVersion)/spm/AmazonChimeSDKMachineLearning-\(SDKMachineLearningVersion).zip",
            checksum: SDKMachineLearningChecksum
        )
    ]
)
