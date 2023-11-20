//
//  CatFactViewModel.swift
//  CatFacts
//
//  Created by Tekla Matcharashvili on 19.11.23.
//
import Foundation
import Combine

class CatFactViewModel: ObservableObject {
    @Published var catFacts: [CatFact] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        fetchCatFacts()
    }
    func fetchCatFacts() {
        CatFactAPIManager().getCatFacts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] response in
                      self?.catFacts = response.data
                  })
            .store(in: &cancellables)
    }
}
