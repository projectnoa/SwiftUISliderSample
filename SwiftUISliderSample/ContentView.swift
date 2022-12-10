//
//	ContentView.swift
//  SwiftUISliderSample
//
//  Created by Juan Mueller on 12/9/22.
//  For more, visit www.ajourneyforwisdom.com
//

import SwiftUI

import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var contrast: Double = 100
    @State private var brightness: Double = 0
    @State private var saturation: Double = 100
    
    var filter: CIFilter?
    
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 50)
                .padding(.bottom, 30)
            
            HStack {
                Text("Contrast:")
                    .bold()
                Text("\((Int(contrast) - 100))%")
                    .bold()
                    .accessibilityIdentifier("contrastSliderValue")
            }
            
            Slider(value: $contrast, in: 0...200, step: 1)
                .padding(.horizontal, 10)
                .onChange(of: contrast,
                          perform: alterImage)
                .accessibilityIdentifier("contrastSlider")
            
            HStack {
                Text("Brightness:")
                    .bold()
                Text("\(Int(brightness))%")
                    .bold()
                    .accessibilityIdentifier("brightnessSliderValue")
            }
            
            Slider(value: $brightness, in: -100...100, step: 1)
                .padding(.horizontal, 10)
                .onChange(of: brightness,
                          perform: alterImage)
                .accessibilityIdentifier("brightnessSlider")
            
            HStack {
                Text("Saturation:")
                    .bold()
                Text("\((Int(saturation) - 100))%")
                    .bold()
                    .accessibilityIdentifier("saturationSliderValue")
            }
            
            Slider(value: $saturation, in: 0...200, step: 1)
                .padding(.horizontal, 10)
                .onChange(of: saturation,
                          perform: alterImage)
                .accessibilityIdentifier("saturationSlider")
            
            Button("Reset") {
                contrast = 100
                brightness = 0
                saturation = 100
            }.padding(.top, 30)
                .buttonStyle(.bordered)
        }.onAppear {
            image = Image("img")
        }.padding(10)
    }
    
    func alterImage(by _: Double) {
        // Retrieve clean instance of the image
        guard let inputImage = UIImage(named: "img") else { return }
        // Initialize a Core Image instance with the UIimage
        let beginImage = CIImage(image: inputImage)
        // Initialize context
        let context = CIContext()
        // Initialize Filter
        let filter = CIFilter.colorControls()
        // Set image
        filter.inputImage = beginImage
        // Apply filter values
        filter.contrast = Float(contrast / 100)
        filter.brightness = Float(brightness / 100)
        filter.saturation = Float(saturation / 100)
        // Retrieve the output
        guard let outputImage = filter.outputImage else { return }
        // Create a CGImage instance from the output
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // Get the UIimage equivalent
            let uiImage = UIImage(cgImage: cgimg)
            // Update the image instance
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
