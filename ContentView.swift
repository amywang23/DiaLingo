//
//  ContentView.swift
//  Dialingo
//
//  Created by Elaine Pan on 2023-11-18.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "Get Started"
    private let alternateWords = ["Start", "البدء", "এবার শুরু করা যাক", "开始吧", "Empezar"] // Add your alternate words
    @State private var currentIndex = 0
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("baby")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                    
                Image("IMG_0069")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .top)
                        
                VStack {
                    Spacer()
                    NavigationLink(destination: DialectListView()) {
                        Text(buttonText)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                            .onAppear {
                                startButtonTimer()
                            }
                    }
                    .padding()
                    .simultaneousGesture(TapGesture().onEnded {
                                        // Handle navigation manually upon tapping the button
                                        buttonText = alternateWords[currentIndex]
                                        navigateToNextPage()
                                    })
                }
            }}
    }
    
    private func startButtonTimer() {
            _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                if currentIndex < alternateWords.count - 1 {
                    currentIndex += 1
                } else {
                    currentIndex = 0
                }
                buttonText = alternateWords[currentIndex]
            }
        }
    }

    private func navigateToNextPage() {
        // buttonText = "Get Started" // Reset button text
        // currentIndex = 0 // Reset index
        
        // Navigate to the next page programmatically
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: DialectListView())
            window.makeKeyAndVisible()
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
