//
//  UserDetailsView.swift
//  BugsProject
//
//  Created by Gerson Janhuel on 25/09/24.
//
import SwiftUI


struct UserDetailsView: View {
    var user: User
    
    @State private var numbers: [Int] = []
    @State private var isGenerating = false

    var body: some View {
        VStack {
            
            Text(user.name)
                .font(.largeTitle)
            Text("Age: \(user.age)")
            Text("Email: \(user.email)")
            
        }
        .padding()
        .onAppear {
            generateNumbers()
        }
    }
    
    func generateNumbers() {
        isGenerating = true
        numbers = []
        
        for _ in 0..<100_000 {
           numbers.append(Int.random(in: 0...1_000_000))
        }
        
        isGenerating = false
    }
}
