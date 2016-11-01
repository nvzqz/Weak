//
//  Unowned.swift
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

/// A type that wraps an `Object` with an `unowned` binding.
public struct Unowned<Object: AnyObject>: CustomStringConvertible {

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

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <T: AnyObject>(lhs: Unowned<T>, rhs: Unowned<T>) -> Bool {
    return lhs.object === rhs.object
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <T: AnyObject>(lhs: Unowned<T>, rhs: T?) -> Bool {
    return lhs.object === rhs
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <T: AnyObject>(lhs: T?, rhs: Unowned<T>) -> Bool {
    return lhs === rhs.object
}

/// Returns a Boolean value indicating whether two references point to the same object instance.
public func === <T: AnyObject>(lhs: Unowned<T>, rhs: Weak<T>) -> Bool {
    return lhs.object === rhs.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <T: AnyObject>(lhs: Unowned<T>, rhs: Unowned<T>) -> Bool {
    return lhs.object !== rhs.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <T: AnyObject>(lhs: Unowned<T>, rhs: T?) -> Bool {
    return lhs.object !== rhs
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <T: AnyObject>(lhs: T?, rhs: Unowned<T>) -> Bool {
    return lhs !== rhs.object
}

/// Returns a Boolean value indicating whether two references point to different object instances.
public func !== <T: AnyObject>(lhs: Unowned<T>, rhs: Weak<T>) -> Bool {
    return lhs.object !== rhs.object
}

/// Returns a Boolean value indicating whether two weak objects are equal.
public func == <T: AnyObject & Equatable>(lhs: Unowned<T>, rhs: Unowned<T>) -> Bool {
    return lhs.object == rhs.object
}

/// Returns a Boolean value indicating whether an unowned object and an optional object are equal.
public func == <T: AnyObject & Equatable>(lhs: Unowned<T>, rhs: T?) -> Bool {
    return lhs.object == rhs
}

/// Returns a Boolean value indicating whether an optional object and an unowned object are equal.
public func == <T: AnyObject & Equatable>(lhs: T?, rhs: Unowned<T>) -> Bool {
    return lhs == rhs.object
}

/// Returns a Boolean value indicating whether two weak objects are not equal.
public func != <T: AnyObject & Equatable>(lhs: Unowned<T>, rhs: Unowned<T>) -> Bool {
    return lhs.object != rhs.object
}

/// Returns a Boolean value indicating whether an unowned object and an optional object are not equal.
public func != <T: AnyObject & Equatable>(lhs: Unowned<T>, rhs: T?) -> Bool {
    return lhs.object != rhs
}

/// Returns a Boolean value indicating whether an optional object and an unowned object are not equal.
public func != <T: AnyObject & Equatable>(lhs: T?, rhs: Unowned<T>) -> Bool {
    return lhs != rhs.object
}
