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
        ZStack {
            List {
                Section {
                    ForEach(viewModel.animalInfos, id: \.id) { animalInfo in
                        NavigationLink(value: animalInfo) {
                            Cell(animalInfo: animalInfo)
                        }
                    }
                } header: {
                    HeaderView(areaInfo: viewModel.areaInfo)
                        .listRowInsets(EdgeInsets())
                }
                .headerProminence(.increased)
            }
            .listStyle(.grouped)
            .navigationTitle(viewModel.areaInfo?.name ?? "")
            
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2)
            }
        }
        .onAppear {
            viewModel.getData()
        }
        .navigationDestination(for: AnimalInfo.self) { animalInfo in
            AnimalDetailView(info: animalInfo)
        }
    }
}

struct HeaderView: View {
    var areaInfo: ZooAreaInfo?
    
    var body: some View {
        PicUrlImage(url: URL(string: areaInfo?.picUrl ?? ""))
        Text(areaInfo?.info ?? "")
            .font(.subheadline)
            .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
        ZStack(alignment: .leading) {
            Color.gray
                .opacity(0.2)
            Text("動物資料")
                .padding(10)
                .foregroundColor(.brown)
        }
    }
}

struct Cell: View {
    var animalInfo: AnimalInfo
    
    var body: some View {
        HStack(spacing: 16) {
            PicUrlImage(url: URL(string: animalInfo.picUrl))
                .frame(width: 150, height: 100)
                .cornerRadius(6)

            VStack(alignment: .leading) {
                Text(animalInfo.name)
                    .font(.headline)
                Text(animalInfo.alsoknown)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}

struct PicUrlImage: View {
    var url: URL?
    
    var body: some View {
        AsyncImage(url: url, content: { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .transition(.slide)
            case .empty:
                ZStack {
                    Color.purple.opacity(0.1)
                    ProgressView()
                }
            case .failure(_):
                Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .scaledToFit()
            @unknown default:
                Image(systemName: "exclamationmark.icloud")
            }
        })
    }
}

struct AreaDetailView_Previews: PreviewProvider {    
    static var previews: some View {
        AreaDetailView()
    }
}
