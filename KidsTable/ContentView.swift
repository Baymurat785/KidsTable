import SwiftUI


struct ContentView: View {
    
    
    @State var multiplicand: Int = 2
    @State var selectedQuestionIndex: Int = 0
    @State var questionAmount: [Int] = [5, 10, 15, 20]
    @State private var showingAddGameView = false
    @State private var showTextField: Bool = false // it will not be used
    @State private var userAnswer: String = "" // There will not be user answers
    @State private var scoreCounter: Int = 0 // There will not be counter
    @State private var showAlert: Bool = false // No need for alert in this view
    @State private var startButtonLabel: String = "Start" // No need for chaning the labels
    

    
    var body: some View {
        VStack(spacing: 20){
        
            sectionForMultiplicationTableSelection
                .padding()
      
          
            sectionForNumberOfQuestionsSelection
        
                .padding()
            Spacer()
            startButton
                .padding()
            Spacer()
            Spacer()
           
        }


        .fullScreenCover(isPresented: $showingAddGameView, content: {
            AddGameView(questionText: generateQuestions(for: multiplicand, numberOfQuestions: questionAmount[selectedQuestionIndex]), multiplicand: multiplicand, numberOfQuestions: questionAmount[selectedQuestionIndex])   //I think question text should be array of strings
        })
    }
    
    private var sectionForMultiplicationTableSelection: some View{
        Section(header: Text("Please select the multiplication table").fontWeight(.semibold)) {
            Stepper("\(multiplicand)", value: $multiplicand, in: 2...12, step: 1)
        }
    }
    
    private var sectionForNumberOfQuestionsSelection: some View {
        Section(header: Text("How many questions do you want to answer?").fontWeight(.semibold)) {
            Picker("", selection: $selectedQuestionIndex) {
                ForEach(0..<questionAmount.count, id: \.self) { i in
                    Text("\(questionAmount[i])")
                    
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
    private var startButton: some View{
        Button(action: {
            // there will link to the another view
            print(questionAmount[selectedQuestionIndex]) // it is interesting/: why I can't see the output on the console
            startGame()
        }, label: {
            Text("Start game")
                .foregroundStyle(.white)
                .padding()
                .background(Color.blue)
                .clipShape(.rect(cornerRadius: 20))
        })
    }

    
    private func startGame(){
       
        showingAddGameView.toggle()
       
    }
    
    
    func generateQuestions(for multiplicand: Int, numberOfQuestions: Int) -> [Question] {
        var questions = [Question]()
           for _ in 1...numberOfQuestions {
               let multiplier = Int.random(in: 2...12)
               let question = Question(multiplicand: multiplicand, multiplier: multiplier)
               questions.append(question)
           }
        questions.append(Question(multiplicand: 0, multiplier: 0))
           return questions
       }
}
@Observable
class Question: Hashable {
    
    let multiplicand: Int
    let multiplier: Int
    
    var answer: Int{
        return multiplier * multiplicand
    }
    
    var questionText: String {
           return "\(multiplicand) × \(multiplier) = "
    }
    
    init(multiplicand: Int, multiplier: Int) {
        self.multiplicand = multiplicand
        self.multiplier = multiplier
    }
    
    static func == (lhs: Question, rhs: Question) -> Bool {
           return lhs.multiplicand == rhs.multiplicand && lhs.multiplier == rhs.multiplier
       }
       
       func hash(into hasher: inout Hasher) {
           hasher.combine(multiplicand)
           hasher.combine(multiplier)
       }
}





#Preview {
    ContentView()
}
