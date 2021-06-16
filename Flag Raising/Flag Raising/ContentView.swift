//
//  ContentView.swift
//  Flag Raising
//
//  Created by Ang Jun Ray on 16/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var chosenFlag = Int.random(in: 1..<264)
    @State var flagOffset = 200
    @State var showGuessFlag = false
    var body: some View {
        VStack{
            Text("Flag Raising!!!")
                .bold()
                .font(.title)
            Text("Click on the flag to raise it, and tap anywhere else to lower it")
                .font(.headline)
                .frame(width: 300, height: 100, alignment: .center)
            Circle()
                .frame(width :510, height: 30, alignment: .top)
                .offset(x: -101, y: 10)
            
            ZStack{
                Path { path in
                    path.move(to: CGPoint(x: 110, y: 0))
                    path.addLine(to: CGPoint(x: 100, y: 0))
                    path.addLine(to: CGPoint(x: 100, y: 550))
                    path.addLine(to: CGPoint(x: 110, y: 550))
                }
                Image(Flags[chosenFlag])
                    .resizable()
                    .frame(width: 195, height: 195, alignment: .center)
                    .offset(x: 0, y: CGFloat(flagOffset))
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                withAnimation{
                                    if(flagOffset > -250){
                                        flagOffset -= 10
                                    }
                                }
                            }
                    )
            }
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        withAnimation{
                            if(flagOffset < 200){
                                flagOffset += 10
                            }
                        }
                    }
            )
            
            Button(action: {
                showGuessFlag = true
            }, label: {
                Text("Guess the flag!")
            })
            .sheet(isPresented: $showGuessFlag, content: {
                GuessTheFlag(flagNumber: chosenFlag)
            })
            
            Button(action: {
                chosenFlag = Int.random(in: 1..<264)
            }, label: {
                Text("New Flag!!!")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
