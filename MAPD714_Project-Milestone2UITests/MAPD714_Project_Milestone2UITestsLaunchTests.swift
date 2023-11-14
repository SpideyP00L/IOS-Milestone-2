//
//  MAPD714_Project_Milestone2UITestsLaunchTests.swift
//  MAPD714_Project-Milestone2UITests
//
// Team number - 8
// Milestone number - 3
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338 , Jeet Panchal -
// Submission Date - 30 October 2023

import XCTest

final class MAPD714_Project_Milestone2UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
