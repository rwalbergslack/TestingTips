//
//  Created by Ryan Walberg on 2023-06-09
//  © Slack Technologies, LLC, a Salesforce company
//

@testable import TestingTips
import XCTest

final class AllocationTrackerTestsGood: XCTestCase {

    private var subject: AllocationTracker!

    override func setUp() {
        super.setUp()

        subject = AllocationTracker()

        print("AllocationTracker instance count: \(AllocationTracker.allocationCount)")
    }

    override func tearDown() {
        subject = nil

        print("AllocationTracker instance count: \(AllocationTracker.allocationCount)")

        super.tearDown()
    }

    func testPositiveNumbers() {
        XCTAssertEqual(subject.add(a: 6, b: 3), 9)
    }

    func testNegativeNumbers() {
        XCTAssertEqual(subject.add(a: -6, b: -3), -9)
    }

    func testMixedSigns() {
        XCTAssertEqual(subject.add(a: 6, b: -3), 3)
    }
}
