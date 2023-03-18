//
//  LoaderView.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-07.
//

import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    let status: QueryStatus
    var body: some View {
        HStack {
            Spacer()
            if (status != .end) {
                if (status == .failed) {
                    Text("Failed. Tap to retry.")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    LoadingView()
                        .foregroundColor(.accentColor)
                }
            }
            Spacer()
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoaderView(isFailed: false, status: .idle)
            LoaderView(isFailed: false, status: .failed)
            LoaderView(isFailed: false, status: .end)
        }
    }
}
