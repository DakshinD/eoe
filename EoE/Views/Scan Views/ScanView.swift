//
//  ScanView.swift
//  EoE
//
//  Created by Dakshin Devanand on 9/27/20.
//

import SwiftUI

struct ScanView: View {
    
    @EnvironmentObject var userData: UserData
    @State private var searchText: String = ""
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    HStack {
                        
                        SearchBar(text: $searchText)
                        
                        HStack {
                            Button(action: {
                                // Open ingredients list scanner
                            }) {
                                Image(systemName: "doc.text.viewfinder")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                            Button(action: {
                                // Open barcode scanner
                            }) {
                                Image(systemName: "barcode.viewfinder")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                            }
                        }
                    }
                    .padding()
                    
                    List {
                        
                        ForEach(userData.pastScans.filter({ searchText.isEmpty ? true : $0.productName.lowercased().contains(searchText.lowercased()) })) { scan in
                            ScanRow(scan: scan)
                        }
                        .listRowBackground(Color("black3"))
                            
                    }
                    .listStyle(InsetGroupedListStyle())
                    .animation(.default)
                    
                    Spacer()
                }
                .background(Color.black)
            }
            .navigationTitle("Scan")
        }
    }
    
    init() {
        // Changes to Navigation Bar
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
            .environmentObject(UserData())
    }
}