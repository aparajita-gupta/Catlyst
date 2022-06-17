//
//  TimerSwiftUIView.swift
//  Catlyst
//
//  Created by Scholar on 6/15/22.
//

import SwiftUI
//let defaultTimeRemaining: CGFloat = 10
let lineWidth: CGFloat = 20
let radius: CGFloat = 70
var isActive:Bool?
public let defaultTimeRemaining: CGFloat = CGFloat(seconds)
public var hours = 0
public var minutes = 0
public var theSeconds = 0

struct TimerSwiftUIView: View {
    @State private var timeRemaining = defaultTimeRemaining
    @State private var isActive = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //275 seconds
    //02:01:14
    func convertSecondsToTime(defaultTimeRemaining : Int) -> String {
        var placeholderMinutes = defaultTimeRemaining / 60 //4
        if(placeholderMinutes >= 60){
            hours = placeholderMinutes/60 //2
            minutes = placeholderMinutes - 60*hours //1
        }else{
            minutes = placeholderMinutes //4
        }
        theSeconds = defaultTimeRemaining%60
        return String(format: "%02i:%02i:%02i", hours, minutes, theSeconds)
    }
    var body: some View {
        VStack(spacing: 90){
            Text(convertSecondsToTime(defaultTimeRemaining: Int(timeRemaining))).font(Font.custom("Sofia Pro", size: 96))
                .fontWeight(.black)
                .foregroundColor(.white)
            ZStack{
                Image("ginger-cat-746").resizable()
                    .scaledToFit()
                    .frame(width:300,height:300)
                Circle()
                    .stroke(Color(hex:"B4D89B"), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .frame(width:250, height: 250)
                Circle()
                    .trim(from: 0, to: 1-((defaultTimeRemaining - timeRemaining)/defaultTimeRemaining))
                    .stroke(Color(hex:"CA7050"), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                    .frame(width:250, height: 250)

            }.frame(width: radius * 3, height: radius * 3)
            
            HStack(spacing: 25) {
                Label("\(isActive ? "pause" : "play")", systemImage: "\(isActive ? "pause.fill" : "play.fill")").padding(10).background(Color(hex:"E7BF82")).foregroundColor(Color(hex:"CA7050"))
                    .font(Font.custom("Sofia Pro Black Az", size: 20)).onTapGesture(perform: {
                    isActive.toggle()
                })
                Label("restart", systemImage: "gobackward").foregroundColor(Color(hex:"CA7050")).padding(10).background(Color(hex:"E7BF82")).font(Font.custom("Sofia Pro Black Az", size: 20)).onTapGesture(perform:{
                    isActive = false
                    timeRemaining = defaultTimeRemaining
                })
            }
        }.onReceive(timer, perform: { _ in guard isActive else {return}
            if timeRemaining > 0 {
                timeRemaining-=1
            } else {
                isActive = false
                timeRemaining = defaultTimeRemaining
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex:"A0BF8A"))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}
struct TimerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TimerSwiftUIView()
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
