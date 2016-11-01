//
//  Weak.swift
//  Weak
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015-2016 Nikolai Vazquez
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

/// A type that wraps an `Object` with a `weak` binding.
public struct Weak<Object: AnyObject>: ExpressibleByNilLiteral, CustomStringConvertible {

    /// The object of `self`.
    public weak var object: Object?

    /// A textual representation of this instance.
    public var description: String {
        if let object = object {
            return "Weak(" + String(reflecting: object) + ")"
        } else {
            return "nil"
        }
    }

    /// Creates an instance for an optional object.
    public init(_ object: Object?) {
        self.object = object
    }

    /// Creates an instance for a `nil` object.
    public init() {
        object = nil
    }

    /// Creates an instance initialized with `nil`.
    public init(nilLiteral: ()) {
        self.init()
    }

}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <T: AnyObject>(lhs: Weak<T>, rhs: Weak<T>) -> Bool {
    return lhs.object === rhs.object
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <T: AnyObject>(lhs: Weak<T>, rhs: T?) -> Bool {
    return lhs.object === rhs
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <T: AnyObject>(lhs: T?, rhs: Weak<T>) -> Bool {
    return lhs === rhs.object
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <T: AnyObject>(lhs: Weak<T>, rhs: Unowned<T>) -> Bool {
    return lhs.object === rhs.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <T: AnyObject>(lhs: Weak<T>, rhs: Weak<T>) -> Bool {
    return lhs.object !== rhs.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <T: AnyObject>(lhs: Weak<T>, rhs: T?) -> Bool {
    return lhs.object !== rhs
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <T: AnyObject>(lhs: T?, rhs: Weak<T>) -> Bool {
    return lhs !== rhs.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <T: AnyObject>(lhs: Weak<T>, rhs: Unowned<T>) -> Bool {
    return lhs.object !== rhs.object
}

// Returns a Boolean value indicating whether two weak objects are equal.
public func == <T: AnyObject & Equatable>(lhs: Weak<T>, rhs: Weak<T>) -> Bool {
    return lhs.object == rhs.object
}

/// Returns a Boolean value indicating whether a weak object and an optional object are equal.
public func == <T: AnyObject & Equatable>(lhs: Weak<T>, rhs: T?) -> Bool {
    return lhs.object == rhs
}

/// Returns a Boolean value indicating whether an optional object and a weak object are equal.
public func == <T: AnyObject & Equatable>(lhs: T?, rhs: Weak<T>) -> Bool {
    return lhs == rhs.object
}

// Returns a Boolean value indicating whether two weak objects are not equal.
public func != <T: AnyObject & Equatable>(lhs: Weak<T>, rhs: Weak<T>) -> Bool {
    return lhs.object != rhs.object
}

/// Returns a Boolean value indicating whether a weak object and an optional object are not equal.
public func != <T: AnyObject & Equatable>(lhs: Weak<T>, rhs: T?) -> Bool {
    return lhs.object != rhs
}

/// Returns a Boolean value indicating whether an optional object and a weak object are not equal.
public func != <T: AnyObject & Equatable>(lhs: T?, rhs: Weak<T>) -> Bool {
    return lhs != rhs.object
}
