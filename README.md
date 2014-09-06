# Swift Reading List
**An iOS app written primarily in Swift with bridged Objective-C model object classes.**

Version 1.11 *(built with Xcode 6 Beta 7)*

## Overview
An iOS example app written in Swift. Demonstrates the following:
* Doing Cocoa touch development in Swift.
* Building and using an iOS 8 framework to share code and resources.
* Using bridging headers to bridge between Objective-C and Swift classes.

Illustrates the use of the Swift language in the implementation of typical Cocoa touch application code, including the following:

* Optionals
* Pattern matching
* Closures
* Extensions
* Swift collections
* Initializers
* Computed properties

## Screenshots

![](images/screenshot-list.tiff)
<span style="width: 36px;">&nbsp;&nbsp;&nbsp;<span>
![](images/screenshot-view.tiff)
<span style="width: 36px;">&nbsp;&nbsp;&nbsp;<span>
![](images/screenshot-edit.tiff)

## Targets

The project consists of the following Xcode targets:

* **ReadingListModel**

 Objective-C classes that model a reading list containing a list of books and authors, as well as an object store controller written in Swift that serializes and deserializes object graphs stored in plist format.

* **ReadingListModelTests**

 Unit tests written in Swift to exercise *ReadingListModel* Swift and Objective-C classes.

* **ReadingListApp**

 Swift subclasses and extensions of UIKit classes. Storyboard-based. Depends on the *ReadingListModel* target.
 
There's also a **ReadingListAppTests** target that's currently unused.

---

Copyright &copy; 2014, [About Objects, Inc.](http://www.aboutobjects.com) All rights reserved. 