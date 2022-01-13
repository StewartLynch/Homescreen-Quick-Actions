//
//  ContentView.swift
//  QuickActions
//
//  Created by Stewart Lynch on 2022-01-12.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var showConfiguration = false
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Picker("", selection: $vm.selectedClassification) {
                        ForEach(Item.Classification.allCases, id: \.self) { item in
                            Text("\(item.rawValue)")
                                .tag(item)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    List(vm.filteredItems) { item in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.emoji)
                                    .font(.largeTitle)
                                Text(item.name)
                            }
                            HStack {
                                Spacer()
                                Text(item.classification.rawValue.capitalized)
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .onChange(of: vm.selectedClassification) { _ in
                        vm.filter()
                    }
                    .navigationTitle(vm.title)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                withAnimation {
                                    showConfiguration.toggle()
                                }
                            } label: {
                                Image(systemName: "gear")
                            }
                        }
                    }
                }
            }
            if showConfiguration {
                ConfigureView(showConfiguration: $showConfiguration)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
