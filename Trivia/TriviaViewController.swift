//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Cheryl Chen on 3/7/25.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionTrackerLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerChoice1: UIButton!
    @IBOutlet weak var answerChoice2: UIButton!
    @IBOutlet weak var answerChoice3: UIButton!
    @IBOutlet weak var answerChoice4: UIButton!
    
    
    private var questions = [TriviaQuestion]()
    private var selectedQuestionIndex: Int = 0
    private var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questions = createMockData()
        configure(with: questions[selectedQuestionIndex])
    }
    
    private func createMockData() -> [TriviaQuestion] {
        let mockData1 = TriviaQuestion(category: .entertainment, question: "What was Olivia Rodrigo's first album?", answers: ["Guts", "Sweet", "Sour", "Bitter"], correctAnswerIndex: 2)
        let mockData2 = TriviaQuestion(category: .sports, question: "Which NBA team won the most championships?", answers: ["Los Angeles Lakers", "Boston Celtics", "Golden State Warriors", "Chicago Bulls"], correctAnswerIndex: 1)
        let mockData3 = TriviaQuestion(category: .science, question: "What is the hardest natural substance on Earth?", answers: ["Gold", "Ruby", "Quartz", "Diamond"], correctAnswerIndex: 3)
        return [mockData1, mockData2, mockData3]
    }
    
    private func configure(with triviaQuestion: TriviaQuestion) {
        questionTrackerLabel.text = "Question: \(selectedQuestionIndex + 1)/\(questions.count)"
        categoryLabel.text = triviaQuestion.category.description
        questionLabel.text = triviaQuestion.question
        answerChoice1.setTitle(triviaQuestion.answers[0], for: .normal)
        answerChoice2.setTitle(triviaQuestion.answers[1], for: .normal)
        answerChoice3.setTitle(triviaQuestion.answers[2], for: .normal)
        answerChoice4.setTitle(triviaQuestion.answers[3], for: .normal)
    }
    
    private func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let restartAction = UIAlertAction(title: "Restart", style: .default) { _ in
            self.selectedQuestionIndex = 0
            self.score = 0
            self.configure(with: self.questions[self.selectedQuestionIndex])
        }
        alertController.addAction(restartAction)
        present(alertController, animated: true)
    }
    
    @IBAction func didTapFirstAnswer(_ sender: UIButton) {
        if (questions[selectedQuestionIndex].correctAnswerIndex == 0) {
            score += 1
            if (selectedQuestionIndex == questions.count - 1) {
                displayAlert(title: "Congratulations!", message: "Final score: \(score)/\(questions.count)")
            }
            else {
                selectedQuestionIndex = selectedQuestionIndex + 1
                configure(with: questions[selectedQuestionIndex])
            }
        }
        else {
            displayAlert(title: "Game Over!", message: "Final score: \(score)/\(questions.count)")
        }
    }
    
    @IBAction func didTapSecondAnswer(_ sender: UIButton) {
        if (questions[selectedQuestionIndex].correctAnswerIndex == 1) {
            score += 1
            if (selectedQuestionIndex == questions.count - 1) {
                displayAlert(title: "Congratulations!", message: "Final score: \(score)/\(questions.count)")
            }
            else {
                selectedQuestionIndex = selectedQuestionIndex + 1
                configure(with: questions[selectedQuestionIndex])
            }
        }
        else {
            displayAlert(title: "Game Over!", message: "Final score: \(score)/\(questions.count)")
        }
    }
    
    @IBAction func didTapThirdAnswer(_ sender: UIButton) {
        if (questions[selectedQuestionIndex].correctAnswerIndex == 2) {
            score += 1
            if (selectedQuestionIndex == questions.count - 1) {
                displayAlert(title: "Congratulations!", message: "Final score: \(score)/\(questions.count)")
            }
            else {
                selectedQuestionIndex = selectedQuestionIndex + 1
                configure(with: questions[selectedQuestionIndex])
            }
        }
        else {
            displayAlert(title: "Game Over!", message: "Final score: \(score)/\(questions.count)")
        }
    }
    
    @IBAction func didTapFourthAnswer(_ sender: UIButton) {
        if (questions[selectedQuestionIndex].correctAnswerIndex == 3) {
            score += 1
            if (selectedQuestionIndex == questions.count - 1) {
                displayAlert(title: "Congratulations!", message: "You win. Final score: \(score)/\(questions.count)")
            }
            else {
                selectedQuestionIndex = selectedQuestionIndex + 1
                configure(with: questions[selectedQuestionIndex])
            }
        }
        else {
            displayAlert(title: "Game Over!", message: "Final score: \(score)/\(questions.count)")
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
