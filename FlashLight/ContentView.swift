//
//  ContentView.swift
//  FlashLight
//
//  Created by Muhammed Said BASMACI on 4.04.2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var backgroundColour = Color.black
    @State var torchColour = Color.white
    var body: some View {
        ZStack {
            backgroundColour.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                HStack{
                    Button(action:{
                        backgroundColour = Color.black
                        torchColour = Color.white
                        toggleTorch(on: false)
                    }){
                        Image(systemName: "flashlight.slash").foregroundColor(torchColour).font(.largeTitle)
                    }
                    Button(action:{
                        backgroundColour = Color.white
                        torchColour = Color.black
                        toggleTorch(on: true)
                    }){
                        Image(systemName: "flashlight.on.fill").foregroundColor(torchColour).font(.largeTitle)
                    }
                    
                    .padding()
                }
            }
        }
    }
        func toggleTorch(on:Bool) {
            guard let device = AVCaptureDevice.default(for: .video) else { return }
            if device.hasTorch {
                do {
                    try device.lockForConfiguration()
                    if on == true {
                        device.torchMode = .on
                    } else {
                        device.torchMode = .off
                    }
                } catch {
                    print("Torch could not be used!")
                }
            }
        }
    }

#Preview {
    ContentView()
}
