//
//  Unowned.swift
//  Weak
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Nikolai Vazquez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

/// A wrapper around an `Object` with a `unowned` binding.
public struct Unowned<Object: AnyObject>: UnownedProtocol, CustomStringConvertible {

    /// The object of `self`.
    public unowned var object: Object

    /// A textual representation of this instance.
    public var description: String {
        return "Unowned(" + String(reflecting: object) + ")"
    }

    /// Creates an instance for an object.
    public init(_ object: Object) {
        self.object = object
    }

}

/// A type that wraps an `Object` with an `unowned` binding.
public protocol UnownedProtocol {

    /// The object type of `Self`.
    associatedtype Object: AnyObject

    /// The object of `self`.
    unowned var object: Object { get }

}

extension Sequence where Iterator.Element: UnownedProtocol {

    /// The objects within `self`.
    public var objects: [Iterator.Element.Object] {
        return map { $0.object }
    }

}

extension Sequence where Iterator.Element: AnyObject {

    /// An array of unowned references to the elements in `self`.
    public var unowned: [Unowned<Iterator.Element>] {
        return map(Unowned.init)
    }

}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <U1: UnownedProtocol, U2: UnownedProtocol>(lhs: U1?, rhs: U2?) -> Bool {
    return lhs?.object === rhs?.object
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <U: UnownedProtocol>(lhs: U?, rhs: AnyObject?) -> Bool {
    return lhs?.object === rhs
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <U: UnownedProtocol>(lhs: AnyObject?, rhs: U?) -> Bool {
    return lhs === rhs?.object
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <U: UnownedProtocol, W: WeakProtocol>(lhs: U?, rhs: W?) -> Bool {
    return lhs?.object === rhs?.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <U1: UnownedProtocol, U2: UnownedProtocol>(lhs: U1?, rhs: U2?) -> Bool {
    return lhs?.object !== rhs?.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <U: UnownedProtocol>(lhs: U?, rhs: AnyObject?) -> Bool {
    return lhs?.object !== rhs
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <U: UnownedProtocol>(lhs: AnyObject?, rhs: U?) -> Bool {
    return lhs !== rhs?.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <U: UnownedProtocol, W: WeakProtocol>(lhs: U?, rhs: W?) -> Bool {
    return lhs?.object !== rhs?.object
}

/// Returns a Boolean value indicating whether two unowned objects are equal.
public func == <U: UnownedProtocol>(lhs: U?, rhs: U?) -> Bool where U.Object: Equatable {
    return lhs?.object == rhs?.object
}

/// Returns a Boolean value indicating whether an unowned object and an optional object are equal.
public func == <U: UnownedProtocol>(lhs: U?, rhs: U.Object?) -> Bool where U.Object: Equatable {
    return lhs?.object == rhs
}

/// Returns a Boolean value indicating whether an optional object and an unowned object are equal.
public func == <U: UnownedProtocol>(lhs: U.Object?, rhs: U?) -> Bool where U.Object: Equatable {
    return lhs == rhs?.object
}

/// Returns a Boolean value indicating whether two unowned objects are not equal.
public func != <U: UnownedProtocol>(lhs: U?, rhs: U?) -> Bool where U.Object: Equatable {
    return lhs?.object != rhs?.object
}

/// Returns a Boolean value indicating whether an unowned object and an optional object are not equal.
public func != <U: UnownedProtocol>(lhs: U?, rhs: U.Object?) -> Bool where U.Object: Equatable {
    return lhs?.object != rhs
}

/// Returns a Boolean value indicating whether an optional object and an unowned object are not equal.
public func != <U: UnownedProtocol>(lhs: U.Object?, rhs: U?) -> Bool where U.Object: Equatable {
    return lhs != rhs?.object
}
