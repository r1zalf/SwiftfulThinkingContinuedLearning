//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Rizal Fahrudin on 30/01/24.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // count
    //    @State var count = 0
    
    // carousel
    //    @State var selection = 1
    
    //date
    //    @State var currentDate = Date()
    
    //    let formatter: DateFormatter = {
    //        let formater = DateFormatter()
    //
    //        formater.timeStyle = .medium
    //        return formater
    //    }()
    
    // countdown
    @State var timeReamaning = ""
    let future: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeReamaning() {
        let reamaning = Calendar.current.dateComponents([.minute, .second], from: Date(), to: future)
        
        let minute = reamaning.minute ?? 0
        let second = reamaning.second ?? 0
        
        timeReamaning = "\(minute) minute: \(second) seconds"
    }
    
    
    
    var body: some View {
        // count
        //        Text(String(count))
        //            .font(.system(size: 100))
        
        // carousel
        //        TabView(selection: $selection) {
        //            Text("Tab Content 1").tabItem { Text("Tab Label 1") }.tag(1)
        //            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
        //            Text("Tab Content 3").tabItem { Text("Tab Label 3") }.tag(3)
        //            Text("Tab Content 4").tabItem { Text("Tab Label 4") }.tag(4)
        
        //
//        Text(formatter.string(from: currentDate))
        //    }
        //        .tabViewStyle(.page(indexDisplayMode: .always))
        //        .frame(height: 250)
        //        .background(.blue)
        
        
        Text(timeReamaning)
            .onReceive(timer) { value in
                // count
                //                if count != 10 {
                //                    count += 1
                //                }
                
                // carousel
                //            withAnimation(.default) {
                //                selection = selection == 4 ? 0 : selection + 1
                //            }
                
                
                updateTimeReamaning()
                
            }
    }
}

#Preview {
    TimerBootcamp()
}
