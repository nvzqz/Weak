# Weak

[![Swift 3.0](https://img.shields.io/badge/swift-3.0-orange.svg)](https://developer.apple.com/swift/)
![Platforms](https://img.shields.io/badge/platform-ios%20%7C%20macos%20%7C%20watchos%20%7C%20tvos%20%7C%20linux-lightgrey.svg)
[![CocoaPods](https://img.shields.io/cocoapods/v/Weak.svg)](https://cocoapods.org/pods/Weak)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-orange.svg)](https://swift.org/package-manager/)
[![MIT License](https://img.shields.io/badge/license-MIT-000000.svg)](https://opensource.org/licenses/MIT)

Weak and Unowned as native Swift types.

## The Problem

Swift allows for `weak` and `unowned` bindings to objects out-of-the-box, but they can't be used just anywhere.

1. They can't be used as associated values of enum cases.

2. They can't be passed as a parameter to a function, method, or initializer without increasing the reference count.

Weak solves these two problems by giving you full control over how you want to pass around `weak` or `unowned`
references.

## Installation

### Compatibility

- Platforms:
    - macOS 10.9+
    - iOS 8.0+
    - watchOS 2.0+
    - tvOS 9.0+
    - Linux
- Xcode 8.0
- Swift 3.0

### Install Using Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a
decentralized dependency manager for Swift.

1. Add the project to your `Package.swift`.

    ```swift
    import PackageDescription

    let package = Package(
        name: "MyAwesomeProject",
        dependencies: [
            .Package(url: "https://github.com/nvzqz/Weak.git",
                     majorVersion: 1)
        ]
    )
    ```

2. Import the Weak module.

    ```swift
    import Weak
    ```

### Install Using CocoaPods
[CocoaPods](https://cocoapods.org/) is a centralized dependency manager for
Objective-C and Swift. Go [here](https://guides.cocoapods.org/using/index.html)
to learn more.

1. Add the project to your [Podfile](https://guides.cocoapods.org/using/the-podfile.html).

    ```ruby
    use_frameworks!

    pod 'Weak', '~> 1.0.0'
    ```

    If you want to be on the bleeding edge, replace the last line with:

    ```ruby
    pod 'Weak', :git => 'https://github.com/nvzqz/Weak.git'
    ```

2. Run `pod install` and open the `.xcworkspace` file to launch Xcode.

3. Import the Weak framework.

    ```swift
    import Weak
    ```

### Install Using Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency
manager for Objective-C and Swift.

1. Add the project to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

    ```
    github "nvzqz/Weak"
    ```

2. Run `carthage update` and follow [the additional steps](https://github.com/Carthage/Carthage#getting-started)
   in order to add Weak to your project.

3. Import the Weak framework.

    ```swift
    import Weak
    ```

### Install Manually

Simply add the `Weak.swift` and `Unowned.swift` files into your project.

## Usage

### Weak References

A `Weak<T>` instance acts just how `weak var foo: T` would. When the reference count hits 0, the `object` property
becomes `nil`.

```swift
let weakRef: Weak<SomeClass>

do {
    let instance = SomeClass()
    weakRef = Weak(instance)
    print(weakRef.object == nil)  // false
}

print(weakRef.object == nil)  // true
```

### Unowned References

An `Unowned<T>` instance should only be used when it will not outlive the life of `object`. Otherwise, accessing
`object` will cause a crash, just like accessing any `unowned` reference after the reference count hits 0.

```swift
let unownedRef: Unowned<SomeClass>

do {
    let instance = SomeClass()
    unownedRef = Unowned(instance)
    print(weakRef.object)  // SomeClass(...)
}

print(unownedRef.object)  // CRASHES
```

## License

Weak is released under the [MIT License](https://opensource.org/licenses/MIT).
