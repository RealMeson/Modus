//
//  ModlistState.swift
//  Mod Manager
//
//  Created by Sean Romel on 2023-03-07.
//

import Foundation
import Combine

class ModlistState: ObservableObject {
    // 1
    @Published var modlist: [ModrinthSearchResultModel] = []
    @Published var isRequestFailed = false
    @Published var status: QueryStatus = .idle
    @Published var queryForm = Query()
    // 2
    private let pageLimit = 100
  
    private var cancellable: AnyCancellable?
    
    func getModlist(refresh: Bool = false) {
        if (refresh == true) {
            modlist = []
            self.status = .idle
        }
        // 3
        cancellable = ModrinthAPIService.shared.getModlist(limit: pageLimit, offset: modlist.count, query: queryForm.query, categories: queryForm.categories, sorting: queryForm.sorting, loader: queryForm.loader)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    // 4
                    self.isRequestFailed = true
                    self.status = .failed
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { mods in
                // 5
                if (mods.count < self.pageLimit) {
                    self.status = .end
                }
                self.modlist.append(contentsOf: mods)
            }
    }
}
