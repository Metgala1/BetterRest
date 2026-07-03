//
//  ContentView.swift
//  BetterRest
//
//  Created by Atagwe Roger on 02/07/2026.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmt = 8.0
    @State private var coffeAmt = 1
    
    @State private var alertTittle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
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
            .alert(alertTittle, isPresented: $showingAlert) {
                Button("Ok"){}
            }message: {
                Text(alertMessage)
            }
        }
        
       
    }
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour , .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmt, coffee: Double(coffeAmt))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTittle = "Your ideal sleep time is.."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        }catch {
            alertTittle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
        }
        
        
        
    }
   

#Preview {
    ContentView()
}
