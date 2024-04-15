import SwiftUI



struct CustomTextStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .font(.title)
            .bold()
            .foregroundColor(.white)
            .background(Color.black.opacity(0.04))
            .shadow(color: .black, radius: 5, x: 0, y: 0)
    }
}

struct CustomImageStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 90, height: 90)
    }
}


struct AddGameView: View{
    @Environment(\.dismiss) var dismiss
    @State var showingNums: String = " "
    @State var questionIndex = 0
    @State var questionText: [Question]
    var userAnswer: String = ""
    @State var scoreCounter: Int = 0
    @State var showingAlert = false
    let multiplicand: Int
    let numberOfQuestions: Int
    var isRotated = false
    
    var contentView = ContentView()
    
    
    var body: some View{
        NavigationStack{
            VStack{
                Spacer()
                
                Text(String(questionText[questionIndex].questionText))
                    .font(.title)
                    .bold()
                    .foregroundStyle(.red)
                Spacer()
                
                ForEach(questionText, id: \.self) { text in
                    
                }
                Text(showingNums)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                HStack{
                    
                }
                Spacer()
                HStack(spacing: 40){
                    Button(action: {
                        showingNums += "1"
                    }, label: {
                        ZStack{
                            Image("1")
                                .customImageStyle()
                            Text("1")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "2"
                    }, label: {
                        ZStack{
                            Image("2")
                                .customImageStyle()
                            Text("2")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "3"
                    }, label: {
                        ZStack{
                            Image("3")
                                .customImageStyle()
                            
                            Text("3")
                                .customTextStyle()
                        }
                    })
                }
                Spacer()
                HStack(spacing: 40){
                    Button(action: {
                        showingNums += "4"
                    }, label: {
                        ZStack{
                            Image("4")
                                .customImageStyle()
                            
                            Text("4")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "5"
                    }, label: {
                        ZStack{
                            Image("5")
                                .customImageStyle()
                            
                            Text("5")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "6"
                    }, label: {
                        ZStack{
                            Image("6")
                                .customImageStyle()
                            
                            Text("6")
                                .customTextStyle()
                        }
                    })
                }
                Spacer()
                HStack(spacing: 40){
                    Button(action: {
                        showingNums += "7"
                    }, label: {
                        ZStack{
                            Image("7")
                                .customImageStyle()
                            
                            
                            Text("7")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "8"
                    }, label: {
                        ZStack{
                            Image("8")
                                .customImageStyle()
                            
                            Text("8")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "9"
                    }, label: {
                        ZStack{
                            Image("9")
                                .customImageStyle()
                            
                            Text("9")
                                .customTextStyle()
                        }
                    })
                }
                
                Spacer()
                HStack(alignment: .center, spacing: 60){
                    Button(action: {
                        if showingNums.last != " " {
                            showingNums.removeLast()
                        }
                    }, label: {
                        Image(systemName: "delete.left")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                    })
                    
                    Button(action: {
                        
                        //Here I am having a problem of Preview Crashed
                        
                        showingNums += "0"
                    }, label: {
                        ZStack{
                            Image("0")
                                .customImageStyle()
                            
                            Text("0")
                                .customTextStyle()
                        }
                    })
                    
                    Button(action: {
                        checkAnswer(userAnswer: questionText[questionIndex]) // Checking the answer...
                        
                    }, label: {
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                    })
                }
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrowshape.backward")
                    }
                    
                }
            }
            
        }.alert("You have finished the round", isPresented: $showingAlert) {
            HStack{
                Button("Continue"){
                    questionIndex = 0
                    questionText = generateQuestions(for: multiplicand, numberOfQuestions: numberOfQuestions)
                    scoreCounter = 0
                    
                    //                    continueTheGame()
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Restart")
                        .bold()
                }
                
            }
        } message: {
            Text("You have answer \(scoreCounter) of \(questionText.count - 1)")
        }
    }
    
    init(questionText: [Question] = [], multiplicand: Int, numberOfQuestions: Int) {
        _questionText = State(initialValue: questionText) //getting error here
        self.multiplicand = multiplicand
        self.numberOfQuestions = numberOfQuestions
    }
    // This init for changin
    
    private func checkAnswer(userAnswer: Question){
        
        if showingNums.trimmingCharacters(in: .whitespaces) == String(userAnswer.answer){
            scoreCounter += 1
            print("Correct")
        }else{
            
            print("Incorrect")
        }
        questionIndex += 1
        showingNums = " "
        presentAlert(index: questionIndex)
        
    }
    
    
    private func presentAlert(index: Int){
        
        if index == questionText.count - 1{
            showingAlert = true
        }
        
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


extension View{
    func customTextStyle() -> some View{
        self.modifier(CustomTextStyle())
    }
}

extension Image {
    func customImageStyle() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90)
            .rotationEffect(.degrees(360))
            .animation(.easeInOut(duration: 0.5))
    }
}

#Preview {
    //    AddGameView(questionText: [Question(multiplicand: 0, multiplier: 0)], q)
    
    AddGameView(questionText: [Question(multiplicand: 0, multiplier: 0)], multiplicand: 0, numberOfQuestions: 0)
}
