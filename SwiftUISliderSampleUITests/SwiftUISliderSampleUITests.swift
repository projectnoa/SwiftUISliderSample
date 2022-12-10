//
//	SwiftUISliderSampleUITests.swift
//  SwiftUISliderSampleUITests
//
//  Created by Juan Mueller on 12/9/22.
//  For more, visit www.ajourneyforwisdom.com
//

import XCTest

final class SwiftUISliderSampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSliderUpdates() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Retrieve all the elements to be interacted with
        let contrastSlider = app.sliders["contrastSlider"]
        let contrastSliderText = app.staticTexts["contrastSliderValue"]
        
        let brightnessSlider = app.sliders["brightnessSlider"]
        let brightnessSliderText = app.staticTexts["brightnessSliderValue"]
        
        let saturationSlider = app.sliders["saturationSlider"]
        let saturationSliderText = app.staticTexts["saturationSliderValue"]
        // Wait
        sleep(1)
        // Trigger an event
        contrastSlider.adjust(toNormalizedSliderPosition: 0.7)
        // Wait
        sleep(1)
        // Trigger an event
        brightnessSlider.adjust(toNormalizedSliderPosition: 0.3)
        // Wait
        sleep(1)
        // Trigger an event
        saturationSlider.adjust(toNormalizedSliderPosition: 0.8)
        // Wait
        sleep(1)
        // Validate your expectations
        XCTAssertEqual(contrastSliderText.label, "41%", "Contrast slider is not updating properly")
        XCTAssertEqual(brightnessSliderText.label, "-41%", "Contrast slider is not updating properly")
        XCTAssertEqual(saturationSliderText.label, "62%", "Contrast slider is not updating properly")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
