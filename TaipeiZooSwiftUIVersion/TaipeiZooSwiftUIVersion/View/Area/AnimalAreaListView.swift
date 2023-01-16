//
//  ContentView.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2022/12/29.
//

import SwiftUI

struct AnimalAreaListView: View {
    @StateObject var viewModel = AreaViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.zooAreaInfos) { zooArea in
                NavigationLink(value: zooArea) {
                    AnimalAreaCell(data: zooArea)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .navigationTitle("台北市立動物園")
            .navigationDestination(for: ZooAreaInfo.self
                                   , destination: { areaInfo in
                AreaDetailView(viewModel: AreaDetailViewModel(areaInfo: areaInfo))
            })
        }
        .loadingView(isLoading: viewModel.isLoading)
        .tint(.black)
        .errorAlert(message: $viewModel.errorMessage)
        .onAppear {
            viewModel.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalAreaListView()
    }
}
