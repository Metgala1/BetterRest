//
//  ContentView.swift
//  BetterRest
//
//  Created by Atagwe Roger on 02/07/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmt = 8.0
    @State private var coffeAmt = 1
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up")
                    .font(.headline)
                DatePicker("Please enter time" , selection: $wakeUp , displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmt.formatted()) hours" , value: $sleepAmt, in: 4...12 , step: 0.25)
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper("\(coffeAmt) cup(s)", value: $coffeAmt, in: 1...20)
            }
            .padding(20)
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
        }
        
       
    }
    func calculateBedTime() {
        
    }
   
}

#Preview {
    ContentView()
}
