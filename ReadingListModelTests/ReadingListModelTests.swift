//
//  ReadingListModelTests.swift
//  ReadingListModelTests
//
//  Created by Jonathan on 9/3/14.
//  Copyright (c) 2014 About Objects. All rights reserved.
//

import UIKit
import XCTest

class ReadingListModelTests: XCTestCase {
    
    let MyStoreName = "BooksAndAuthors" as NSString
    
    override func setUp() {
        super.setUp()
        putchar(10)
    }
    
    override func tearDown() {
        putchar(10)
        super.tearDown()
    }
    
    func testCreateStoreWithName()
    {
        var store = ReadingListObjectStore(MyStoreName)
        println("In \(__FUNCTION__): store is \(store)")
        XCTAssertNotNil(store, "Store should not be nil")
    }
    
    
    func testLoadData()
    {
        let store = ReadingListObjectStore(MyStoreName)
        let expected = store.readingList()
        println("In \(__FUNCTION__): reading list is \(expected)")
    }
    
    func testLoadDataPerformance()
    {
        self.measureBlock() {
            for i in 0..<10_000 {
                let store = ReadingListObjectStore(self.MyStoreName)
            }
        }
    }
}
