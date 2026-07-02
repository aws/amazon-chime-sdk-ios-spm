// swift-tools-version: 5.6
import PackageDescription

// Current stable version of the Amazon Chime SDK for iOS
let SDKVersion = "0.27.3"
let SDKMediaVersion = "0.25.3"
let SDKMachineLearningVersion = "0.3.2"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKChecksum = "47aedc4a278f531612e0f8f3fa1541236e9311453342c2a2c8b3759fa358afc9"
let SDKMediaChecksum = "a29379390d7dd4e3e355efa2687a715ceeff27ea862b8d7dc89e5ed81cdb2f8a"
let SDKMachineLearningChecksum = "b5fb6a4c27ec126a17603e380e59729135cb8fc743b15804663d657fbcda7588"

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
