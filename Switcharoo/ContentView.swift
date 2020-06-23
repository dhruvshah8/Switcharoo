//
//  ContentView.swift
//  Switcharoo
//
//  Created by Dhruv Shah on 2020-06-23.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //Letters being shown to the user
    @State private var activeLetters = [String](repeating: "Blank", count: 4)
    @State private var tray = [String](repeating: "Blank", count: 10)
    @State private var buttonFrames = [CGRect](repeating: .zero, count: 4)
    
    //Set of Strings with starting words and possible words
    let alllowedWords = Bundle.main.words(from: "words.txt")
    let startWords = Bundle.main.words(from: "start.txt")
    
    
    var body: some View {
        
        VStack(spacing: 20){
            Image("Switcharoo")
                .padding()
            
            Spacer()
            
            // active letters
            HStack{
                ForEach(0..<4) { number in
                    Letter(text: self.activeLetters[number]).allowsHitTesting(false)
                        // Geometry Reader: Allows us to know the position of the overlay in global space of the game - marks the area where the letter is places
                        .overlay(GeometryReader { geo in
                            Color.clear
                                .onAppear{
                                    self.buttonFrames[number] = geo.frame(in: .global) //gets position of each letter once it loads up
                            }
                            }
                    )
                    
                    //dont let them move
                    
                    
                }
            }
            
            Spacer()
            
            // letter tray - 10 altenative
            HStack{
                ForEach(0..<10){ number in
                    Letter(text: self.tray[number], onChanged: self.letterMoved)
                }
            }
        }
        .frame(width: 1024, height: 768)
        .background(Image("Background"))
        .onAppear(perform: startGame)
        
        
    }
    
    func startGame() {
        let newWord = startWords.randomElement() ?? "CAPE"
        activeLetters = newWord.map(String.init) //convert word into array of string characters
        tray = (1...10).map { _ in self.randomLetter() } //chose 10 random letters for tray
        
    }
    
    func randomLetter() -> String {
        return
            //balanced to return more common letters  - not the most effective way to do so
            String("AAAAABBCCDDDDEEEEEEFGGHIIIJKLLLMMMMMNNNNOOOOPPPQRRRRSSSSTTTTUVWWXYZ".randomElement()!)
    }
    
    //which button is our dragged button moving over right now
    //letter -> their dragable letter
    func letterMoved (location: CGPoint, letter: String) -> DragState {
        
        
        // if let -> check if button is on the frame and if location are the same let match = index (which letter frame)
        
        if let match = buttonFrames.firstIndex(where: {
            $0.contains(location)
        }) {
            
            //if its the same letter being replaced
            if activeLetters[match] == letter { return .bad}
            
            var testLeters = activeLetters
            testLeters[match] = letter
            let testWord = String(testLeters.joined())
            if alllowedWords.contains(testWord) {
                return .good
            }else{
                return .bad
            }
        }else{
            return .unknown
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
