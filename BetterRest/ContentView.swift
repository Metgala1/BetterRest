//
//  ContentView.swift
//  BetterRest
//
//  Created by Atagwe Roger on 02/07/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
       
    }
    func exampleDate () {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
}

#Preview {
    ContentView()
}
