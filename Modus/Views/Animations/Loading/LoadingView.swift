//
//  LoadingView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-10.
//

import SwiftUI

struct LoadingView: View {
    private struct DotView: View {
        
        @Binding var scale: CGFloat

        var body: some View {
            Circle()
                .scale(scale)
                .fill(.foreground.opacity(scale >= 0.7 ? scale : scale - 0.1))
                .frame(width: 16, height: 16, alignment: .center)
        }
    }

    struct AnimationData {
        var delay: TimeInterval
    }

    static let DATA = [
        AnimationData(delay: 0.0),
        AnimationData(delay: 0.2),
        AnimationData(delay: 0.4),
    ]

    @State var scales: [CGFloat] = DATA.map { _ in return 0 }

    var animation = Animation.easeInOut.speed(0.5)

    var body: some View {
        HStack {
            DotView(scale: .constant(scales[0]))
            DotView(scale: .constant(scales[1]))
            DotView(scale: .constant(scales[2]))
        }
        .onAppear {
            animateDots() // Not defined yet
        }
    }
    
    func animateDots() {
        for (index, data) in Self.DATA.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + data.delay) {
                animateDot(binding: $scales[index], animationData: data)
            }
        }

        //Repeat
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            animateDots()
        }
    }

    func animateDot(binding: Binding<CGFloat>, animationData: AnimationData) {
        withAnimation(animation) {
            binding.wrappedValue = 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(animation) {
                binding.wrappedValue = 0.2
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .foregroundColor(.blue)
    }
}
