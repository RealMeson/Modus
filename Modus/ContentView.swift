//
//  ContentView.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-18.
//

import SwiftUI

struct ContentView: View {
    @StateObject var store = Store()
    var body: some View {
        NavigationColumnView()
            .environmentObject(store)
            .environmentObject(store.modDetailsState)
            .environmentObject(store.modlistState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
