//
//  GuessTheFlag.swift
//  Flag Raising
//
//  Created by Ang Jun Ray on 16/6/21.
//

import SwiftUI

struct GuessTheFlag: View {
    var flagNumber:Int
    @State var input:String = ""
    @State var showResult = false
    @State var Result = true
    var body: some View {
        VStack{
            Text("Guess the current flag!!!")
                .bold()
                .font(.title)
            Image(Flags[flagNumber])
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            TextField("Flag Name:", text: $input)
                .border(Color.black)
            
            Button(action: {
                let flagName:String = flagNames[flagNumber]
                showResult = true
                if(flagName == input){
                    Result = true
                } else {
                    Result = false
                }
            }, label: {
                Text("Submit")
            })
            
            if(showResult){
                if(Result){
                    Image("correct")
                } else {
                    Image("wrong")
                }
            }
        }
    }
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag(flagNumber: 3)
    }
}
