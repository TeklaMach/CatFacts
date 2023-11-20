//
//  ContentView.swift
//  CatFacts
//
//  Created by Tekla Matcharashvili on 19.11.23.
//


import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CatFactViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.catFacts, id: \.fact) { catFact in
                VStack(alignment: .leading) {
                    Text(catFact.fact)
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
            .navigationBarTitle("Cat Facts")
            .background(
                Image("cats")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .listStyle(PlainListStyle())
        }
        .onAppear {
            viewModel.fetchCatFacts()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
