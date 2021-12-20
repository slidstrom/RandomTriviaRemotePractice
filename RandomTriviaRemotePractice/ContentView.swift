//
//  ContentView.swift
//  RandomTriviaRemotePractice
//
//  Created by DSIAdmin on 12/20/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: Model
    
    var body: some View {
        
        VStack{
            Spacer()
            Text(model.fact)
            Spacer()
            Button {
                model.getFact()
            } label: {
                Text("Get a new Fact")
            }
            Spacer()
            

        }
        .padding()
        
    }
    
    
}


