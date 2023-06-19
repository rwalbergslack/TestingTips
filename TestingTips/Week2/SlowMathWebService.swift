//
//  Created by Ryan Walberg on 2023-06-19
//  © Slack Technologies, LLC, a Salesforce company
//

import Foundation

class SlowMathWebService {
    func addition(numbers: [Int], completion: @escaping (Int) -> Void) throws {
        // simulate calling a web service
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1_500) {
            completion(numbers.reduce(0, +))
        }
    }
}
