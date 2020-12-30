//
//  AppcentDemoTests.swift
//  AppcentDemoTests
//
//  Created by Hakan Üstünbaş on 23.12.2020.
//

import XCTest
@testable import AppcentDemo

class AppcentDemoTests: XCTestCase {
    
    
    func testAppcent(){
        
        let test = CurriosityViewController()
        test.getCuriosityRequest()
        
        let result = test.getArrayCount()
        XCTAssertEqual(result, 0)
    }
    
    func test2Appcent(){
        
        let test = OppurtunityViewController()
        let variable = test.currentPage
        
        XCTAssertEqual(variable, 1)
    }
    
    func test3Appcent(){
        
        let test = SpiritViewController()
        let carName = test.rover
        
        XCTAssertEqual(carName, "spirit")
        
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
