//
//  ContentView.swift
//  KidsTable
//
//  Created by Baymurat Abdumuratov on 24/02/24.
//

import SwiftUI

// Define ContentView struct, the main view of the application
struct ContentView: View {
    // State variables to manage dynamic data
    
    
    @State var multiplicand: Int = 2
    @State var showTextField: Bool = false
    @State var selectedQuestionIndex: Int = 0
    @State var questionNum: [Int] = [5,10,15,20]
    @State var questionText: String = ""
    @State var userAnswer: String = ""
    @State var OKButton: String = "Next"
    @State var counterOfScores: Int = 0
    @State var counterOfRounds: Int = 0
    @State var showAlert: Bool = false
    @State var questions = [Question]()
    @State var labelofStartButton: String = "Start"
    @State var index: Int = 0
    
    // Body property defines the layout of the view
    var body: some View {
        List {
            // Section for selecting the multiplication table
            Section {
                VStack {
                    Text("Please select the multiplication table")
                        .fontWeight(.semibold)
                }
                Stepper("\(multiplicand)", value: $multiplicand, in: 2...12, step: 1)
            }
            
            // Section for selecting the number of questions
            Section {
                VStack(alignment: .leading) {
                    Text("How many questions do you want to answer?")
                        .fontWeight(.semibold)
                    Picker("", selection: $selectedQuestionIndex) {
                        ForEach(0..<questionNum.count) {
                            Text("\(questionNum[$0])")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            
            // Button to start or restart the game
            Button(action: {
                startGame()
            }, label: {
                Text(labelofStartButton)
                    .frame(maxWidth: .infinity, alignment: .center)
            })
            
            // Section for displaying questions and receiving user answers
            if showTextField {
                Section {
                    Text(questions[index].questionText)
                        .font(.title3)
                    HStack {
                        TextField("", text: $userAnswer)
                            .keyboardType(.numberPad)
                        Spacer()
                        Button(OKButton) {
                            nextQuestion()
                        }
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("The game is over"),
                        message: Text("You found \(counterOfScores) of \(questionNum[selectedQuestionIndex])"),
                        dismissButton: .default(Text("Restart")) {
                            restart()
                        }
                    )
                }
            }
        }
    }
    
    // Function to start the game
    func startGame() {
        questions = generateQuestions(for: multiplicand, numberOfQuestions: questionNum[selectedQuestionIndex])
        showTextField = true
        labelofStartButton = "Restart"
        index = 0
        counterOfScores = 0
        showAlert = false
    }
    
    // Function to handle the next question
    func nextQuestion() {
        guard let userAns = Int(userAnswer) else { return }
        if userAns == questions[index].answer {
            counterOfScores += 1
        }
        if index == questions.count - 1 {
            showAlert = true
        } else {
            index += 1
        }
        userAnswer = ""
    }
    
    // Function to restart the game
    func restart() {
        startGame()
        questionText = ""
        userAnswer = ""
        showTextField = false
        labelofStartButton = "Start"
    }
    
    // Function to generate questions
    func generateQuestions(for multiplicand: Int, numberOfQuestions: Int) -> [Question] {
        var questions = [Question]()
        for _ in 1...numberOfQuestions {
            let multiplier = Int.random(in: 2...12)
            let question = Question(multiplicand: multiplicand, multiplier: multiplier)
            questions.append(question)
        }
        return questions
    }
}

// Define Question struct to represent a single multiplication question
struct Question: Hashable {
    let multiplicand: Int
    let multiplier: Int
    
    // Computed property to calculate the answer
    var answer: Int {
        return multiplier * multiplicand
    }
    
    // Computed property to generate the question text
    var questionText: String {
        return "\(multiplicand) × \(multiplier) = "
    }
}

// Preview the ContentView
#Preview {
    ContentView()
}
