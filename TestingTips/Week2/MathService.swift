//
//  Created by Ryan Walberg on 2023-06-19
//  © Slack Technologies, LLC, a Salesforce company
//

import Foundation

class MathService {
    func synchronousSumWithAverage(numbers: [Int]) -> (Int, Double) {
        let sum = numbers.reduce(0, +)
        return (sum, Double(sum) / Double(numbers.count))
    }

    func localAsynchronousSumWithAverage(numbers: [Int], completion: @escaping (Int, Double) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let sum = numbers.reduce(0, +)
            completion(sum, Double(sum) / Double(numbers.count))
        }
    }

    func remoteAsynchronousSumWithAverage(numbers: [Int], completion: @escaping (Int, Double) -> Void) throws {
        try SlowMathWebService().addition(numbers: numbers) {
            completion($0, Double($0) / Double(numbers.count))
        }
    }
}
