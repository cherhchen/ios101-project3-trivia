//
//  triviaQuestion.swift
//  Trivia
//
//  Created by Cheryl Chen on 3/10/25.
//

import Foundation
import UIKit

struct TriviaQuestion {
    let category: Category
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
}

enum Category {
    case entertainment
    case sports
    case science
    case history
    case geography
    case art
    
    var description: String {
        switch self {
        case .entertainment:
            return "Entertainment"
        case .sports:
            return "Sports"
        case .science:
            return "Science"
        case .history:
            return "History"
        case .geography:
            return "Geography"
        case .art:
            return "Art"
        }
    }
}
