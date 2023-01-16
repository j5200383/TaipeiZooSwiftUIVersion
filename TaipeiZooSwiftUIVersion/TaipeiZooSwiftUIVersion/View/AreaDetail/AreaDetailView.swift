//
//  AreaDetailView.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2022/12/29.
//

import SwiftUI

struct AreaDetailView: View {
    @StateObject var viewModel = AreaDetailViewModel()
    @State var isPresented = false
    
    var body: some View {
        GeometryReader { reader in
            List {
                Section {
                    ForEach(viewModel.animalInfos, id: \.id) { animalInfo in
                        NavigationLink(value: animalInfo) {
                            AreaDetailCellView(animalInfo: animalInfo)
                        }
                    }
                } header: {
                    AreaDetailHeaderView(areaInfo: viewModel.areaInfo)
                        .frame(width: reader.size.width)
                        .listRowInsets(EdgeInsets())
                }
                .headerProminence(.increased)
            }
            .listStyle(.grouped)
            .navigationTitle(viewModel.areaInfo?.name ?? "")
            .loadingView(isLoading: viewModel.isLoading)
            .errorAlert(message: $viewModel.errorMessage)
            .onAppear {
                viewModel.getData()
            }
            .navigationDestination(for: AnimalInfo.self) { animalInfo in
                AnimalDetailView(info: animalInfo)
            }
        }
    }
}

struct AreaDetailView_Previews: PreviewProvider {    
    static var previews: some View {
        AreaDetailView()
    }
}
