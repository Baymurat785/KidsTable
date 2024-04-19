<<<<<<< HEAD
import SwiftUI



struct CustomTextStyle: ViewModifier{
=======
//
//  AddGameView.swift
//  KidsTable
//
//  Created by Baymurat Abdumuratov on 01/03/24.
//

import SwiftUI


struct CustomTextStyle: ViewModifier {
    
  
    
    
>>>>>>> 227a157 (Final change)
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


<<<<<<< HEAD
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
=======
struct AddGameView: View {
    @Environment(\.dismiss) var dismiss
    @State var showingNums: String = " "
    var questionText: String = ""
    var userAnswer: String = ""

    
    var body: some View {
      
        NavigationStack{
            VStack{
                Spacer()
                Text(questionText)
                    .font(.title)
                    .foregroundStyle(.red)
                Spacer()
                
                    .font(.title)
>>>>>>> 227a157 (Final change)
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
<<<<<<< HEAD
                            Image("1")
=======
                            Image("bear")
>>>>>>> 227a157 (Final change)
                                .customImageStyle()
                            Text("1")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "2"
                    }, label: {
                        ZStack{
<<<<<<< HEAD
                            Image("2")
=======
                            Image("buffalo")
>>>>>>> 227a157 (Final change)
                                .customImageStyle()
                            Text("2")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "3"
                    }, label: {
                        ZStack{
<<<<<<< HEAD
                            Image("3")
=======
                            Image("chick")
>>>>>>> 227a157 (Final change)
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
<<<<<<< HEAD
                            Image("4")
=======
                            Image("chicken")
>>>>>>> 227a157 (Final change)
                                .customImageStyle()
                            
                            Text("4")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "5"
                    }, label: {
                        ZStack{
<<<<<<< HEAD
                            Image("5")
=======
                            Image("cow")
>>>>>>> 227a157 (Final change)
                                .customImageStyle()
                            
                            Text("5")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "6"
                    }, label: {
                        ZStack{
<<<<<<< HEAD
                            Image("6")
=======
                            Image("crocodile")
>>>>>>> 227a157 (Final change)
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
<<<<<<< HEAD
                            Image("7")
=======
                            Image("duck")
>>>>>>> 227a157 (Final change)
                                .customImageStyle()
                            
                            
                            Text("7")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "8"
                    }, label: {
                        ZStack{
<<<<<<< HEAD
                            Image("8")
=======
                            Image("dog")
>>>>>>> 227a157 (Final change)
                                .customImageStyle()
                            
                            Text("8")
                                .customTextStyle()
                        }
                    })
                    Button(action: {
                        showingNums += "9"
                    }, label: {
                        ZStack{
<<<<<<< HEAD
                            Image("9")
=======
                            Image("giraffe")
>>>>>>> 227a157 (Final change)
                                .customImageStyle()
                            
                            Text("9")
                                .customTextStyle()
                        }
                    })
                }
<<<<<<< HEAD
                
=======
>>>>>>> 227a157 (Final change)
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
<<<<<<< HEAD
                            Image("0")
=======
                            Image("elephant")
>>>>>>> 227a157 (Final change)
                                .customImageStyle()
                            
                            Text("0")
                                .customTextStyle()
                        }
                    })
                    
                    Button(action: {
<<<<<<< HEAD
                        checkAnswer(userAnswer: questionText[questionIndex]) // Checking the answer...
                        
=======

                        

>>>>>>> 227a157 (Final change)
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
            
<<<<<<< HEAD
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
=======
        }
    }
    
>>>>>>> 227a157 (Final change)
    
    
    
}

<<<<<<< HEAD

=======
>>>>>>> 227a157 (Final change)
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
<<<<<<< HEAD
            .rotationEffect(.degrees(360))
            .animation(.easeInOut(duration: 0.5))
=======
>>>>>>> 227a157 (Final change)
    }
}

#Preview {
<<<<<<< HEAD
    //    AddGameView(questionText: [Question(multiplicand: 0, multiplier: 0)], q)
    
    AddGameView(questionText: [Question(multiplicand: 0, multiplier: 0)], multiplicand: 0, numberOfQuestions: 0)
=======
    AddGameView(questionText: String())
>>>>>>> 227a157 (Final change)
}
