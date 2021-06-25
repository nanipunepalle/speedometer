//
//  ContentView.swift
//  speedometer
//
//  Created by Lalith  on 25/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationController: LocationController
    
    var body: some View {
        VStack {
            Text("SpeedoMeter")
                .padding()
            Spacer()
            
//            Spacer()
            ZStack {
                ZStack{
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(Color.primary.opacity(0.1),lineWidth: 55)
                        .frame(width: 300, height: 300, alignment: .center)
                    Circle()
                        .trim(from: 0, to: CGFloat(Int(locationController.speed*3.6)/200))
                        .stroke(Color.green.opacity(0.5),lineWidth: 55)
                        .frame(width: 300, height: 300, alignment: .center)
                        
                }.rotationEffect(.init(degrees: 128))
                ZStack(alignment:.bottom){
                    VStack {
                        Text(String(Int(locationController.speed*3.6)))
//                            .foregroundColor(Color.black.opacity(1))
                            .font(Font.system(size:130, design: .default))
                        Text("KMPH")
//                            .foregroundColor(Color.black.opacity(1))
                            .font(Font.system(size:30, design: .default))
                    }
                    
//                    Rectangle()
//                        .fill(Color.red)
//                        .frame(width: 3, height: 105)
                }
//                .offset(y:-35)
//                .rotationEffect(.init(degrees: -135))
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locationController: LocationController())
    }
}
