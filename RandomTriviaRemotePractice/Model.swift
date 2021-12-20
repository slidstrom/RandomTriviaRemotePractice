//
//  Model.swift
//  RandomTriviaRemotePractice
//
//  Created by DSIAdmin on 12/20/21.
//

import Foundation

class Model : ObservableObject {
    
    @Published var fact = ""
    
    init(){
        getFact()
    }
    
    func getFact(){
        // String path
        let urlString = "http://numbersapi.com/random/trivia"
        
        // Create a url object
        if let url = URL(string: urlString){
            
            // Create data task
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                // make sure there is data
                if let data = data {
                    
                    // turn data into a string
                    if let stringData = String(data: data, encoding: .utf8){
                        DispatchQueue.main.async {
                            self.fact = stringData
                        }
                    }
                }
                
            }.resume()
        }
    }
    
}

/*
 
 class Model : ObservableObject {
     
     @Published var fact = ""
     
     init() {
         getFact()
     }
     
     func getFact() {
         
         // URL we want to access
         let urlString = "http://numbersapi.com/random/trivia"
         
         // Check if we can create URL from string
         if let url = URL(string: urlString) {
             
             // Create data task
             URLSession.shared.dataTask(with: url) { (data, response, error) in
                 
                 // Check for errors
                 if let error = error {
                     print(error.localizedDescription)
                     return
                 }
                 
                 // Make sure there is data
                 if let data = data {
                     
                     // Turn the data into text form
                     if let stringData = String(data: data, encoding: .utf8) {
                         
                         // UI updates must happen on the main thread
                         DispatchQueue.main.async {
                             self.fact = stringData
                         }
                         
                     }
                 }
             }
             .resume() // Remember to start the datatask!
         }
     }
     
 }
 
*/
