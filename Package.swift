// swift-tools-version: 5.6
import PackageDescription

// Current stable version of the Amazon Chime SDK for iOS
let SDKVersion = "0.23.1"
let SDKMediaVersion = "0.18.1"
let SDKMachineLearningVersion = "0.2.0"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKChecksum = "ee267d3232f72bc4e4c2ccd37dabed89750a1ef2159d3ef8d0396c8ef1cadfb4"
let SDKMediaChecksum = "20268ae2c8c17e8721576ebf0846a837db2e15eca37ebe0e9c0d6c1c365b3a12"
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
