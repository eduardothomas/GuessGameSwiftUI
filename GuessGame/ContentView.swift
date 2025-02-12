//
//  ContentView.swift
//  GuessGame
//
//  Created by Eduardo Thomas on 02/12/25.
//

import SwiftUI

struct ContentView: View {
    //let correctAnswer = Int.random(in: 1..<3)
    @State private var correctAnswer = 0
    @State private var score = 0
    @State private var gameTitle = "?"
    @State private var gameSubTitle = ""
    
    var body: some View {
        VStack {
            VStack {
                Text(gameTitle)
                    .font(.largeTitle)
                    .fontWeight(.black)
                Text(gameSubTitle)
                    .font(.system(size: 20))
            }
            .frame(height: 250)
            HStack {
                Spacer()
                Text("Score \(score)")
                    .font(.system(size: 20, weight: .semibold))
            }
            Button(action: {
                checkAnswer(answer: 0)
            }, label: {
                Image("dog")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            Button(action: {
                print("cat")
                checkAnswer(answer: 1)
            }, label: {
                Image("cat")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            Button(action: {
                print("fox")
                checkAnswer(answer: 2)
            }, label: {
                Image("fox")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            Spacer()
        }
        .padding()
    }
    
    func checkAnswer(answer: Int) {
        if answer == correctAnswer {
            score = score + 1
            gameTitle = "Success"
        } else {
            if score != 0 {
                score -= 1
            }
            gameTitle = "Wrong"
        }
        
        if correctAnswer == 0 {
            gameSubTitle = "The correct answer was dog!"
        } else if correctAnswer == 1 {
            gameSubTitle = "The correct answer was cat!"
        } else if correctAnswer == 2 {
            gameSubTitle = "The correct answer was fox!"
        }
        
        randomizeCorrectAnswer()
    }
    
    func randomizeCorrectAnswer() {
        let randomCorrectAnswer = Int.random(in: 1..<3)
        correctAnswer = randomCorrectAnswer
    }
}

#Preview {
    ContentView()
}
