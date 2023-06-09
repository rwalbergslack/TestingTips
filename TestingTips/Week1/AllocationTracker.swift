//
//  Created by Ryan Walberg on 2023-06-09
//  © Slack Technologies, LLC, a Salesforce company
//

import Foundation

class AllocationTracker {

    public static private(set) var allocationCount = 0

    init() {
        Self.allocationCount += 1
    }

    deinit {
        Self.allocationCount -= 1
    }

    public func add(a: Int, b: Int) -> Int {
        a + b
    }
}
