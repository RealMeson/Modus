//
//  ModrinthArchiveStore.swift
//  Modus
//
//  Created by Sean Romel on 2023-04-01.
//

import Foundation
import Combine

class ModrinthArchiveState: ObservableObject {
    @Published var modDetails: [ModrinthProjectModel] = []
    @Published var isRequestFailed = false
    @Published var selection = Set<String>()
    
    private var cancellable: AnyCancellable?
    private let cache = Cache<ModrinthProjectModel.ID, ModrinthProjectModel>()
    
    func getModDetails() {
        if (!selection.isEmpty) {
            if let cached = cache[selection.first!] {
                modDetails = [cached]
            } else {
                cancellable = ModrinthAPIService.shared.getMod(selection.first ?? "sodium")
                    .receive(on: DispatchQueue.main)
                    .sink { completion in
                        switch completion {
                        case .failure(let error):
                            // 4
                            self.isRequestFailed = true
                            print(error)
                        case .finished:
                            print("finished")
                        }
                    } receiveValue: { mod in
                        // 5
                        self.modDetails = [mod]
                    }
            }
        }
    }
}
