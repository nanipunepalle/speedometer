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
            Spacer()
            Text("SpeedoMeter")
                .padding()
            Spacer()
            
            ZStack {
                ZStack{
                    Circle()
                        .trim(from: 0, to: 0.8)
                        .stroke(Color.primary.opacity(0.1),lineWidth: 55)
                        .frame(width: 300, height: 300, alignment: .center)
                    Circle()
                        .trim(from: 0, to:CGFloat(locationController.speedProgress*0.004))
                        .stroke(Color.green.opacity(0.5),lineWidth: 55)
                        .frame(width: 300, height: 300, alignment: .center)
                        .modifier(CircularView(speed: Int(locationController.speedProgress)))
//                        .animation(.easeIn)
                    
                }.rotationEffect(.init(degrees: 126))
                ZStack(alignment:.bottom){
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 5, height: 105)
                }
                .offset(y:-50)
                .rotationEffect(.init(degrees: Double(-145+Int(locationController.speedProgress*1.45))))
//                .animation(.easeIn)
                .modifier(RectangleView(speed: Int(locationController.speedProgress)))
                
            }
            VStack {
                Text(String(Int(locationController.speed)))
                    .font(Font.system(size:130, design: .default))
                    .modifier(SpeedNumberView(speed: Int(locationController.speed)))
                
                Text("KMPH")
                    .font(Font.system(size:30, design: .default))
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


struct SpeedNumberView: AnimatableModifier {
    var speed: Int

    var animatableData: CGFloat {
        get { CGFloat(speed) }
        set { speed = Int(newValue) }
    }

    func body(content: Content) -> some View {
        Text(String(speed))
            .font(Font.system(size:130, design: .default))
    }
}

struct CircularView: AnimatableModifier {
    var speed: Int

    var animatableData: CGFloat {
        get { CGFloat(speed) }
        set { speed = Int(newValue) }
    }

    func body(content: Content) -> some View {
        Circle()
            .trim(from: 0, to:CGFloat(Double(speed)*0.004))
            .stroke(Color.green.opacity(0.5),lineWidth: 55)
            .frame(width: 300, height: 300, alignment: .center)
    }
}

struct RectangleView: AnimatableModifier {
    var speed: Int

    var animatableData: CGFloat {
        get { CGFloat(speed) }
        set { speed = Int(newValue) }
    }

    func body(content: Content) -> some View {
        ZStack(alignment:.bottom){
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 5, height: 105)
        }
        .offset(y:-50)
        .rotationEffect(.init(degrees: Double(-145+Int(Double(speed)*1.45))))
//        .animation(.easeIn)
    }
}
