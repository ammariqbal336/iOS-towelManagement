//
//  HomeView.swift
//  TowelManagement
//
//  Created by mac on 04/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm : HomeViewModel = HomeViewModel()
    
    @State var showToast = false
    
    
    private let fixedColumn = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    var body: some View {
        NavigationView{
            ScrollView {
                
                LazyVGrid(columns: fixedColumn,spacing: 20){
                    ForEach(vm.data) { datum in
                       
                        
                        NavigationLink{
                            switch datum.id {
                            case 1:
                                TowelTypeView()
                                
                            case 2:
                                TowelSizeView()
                            
                            case 3:
                                TowelInfoView()
                                
                            case 4:
                                TowelRateView()
                            case 5:
                                ClientTypeView()
                            case 6:
                                ClientInfoView()
                            case 7:
                                TransactionBillView()
                                
                            case .none:
                                   TowelSizeView()
                            case .some(_):
                                TowelSizeView()
                            }
                           
                        }label: {
                            VStack {
                                
                                Image(systemName: "folder")
                                Text(datum.name)
                                    .padding()
                                
                            }
                            
                                .frame(width: 130, height: 130, alignment: .center)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .font(.headline)
                                .background(.orange,in: RoundedRectangle(cornerRadius: 20))
                                .clipped()
                                .shadow(radius: 5)
                        }
                       
                    }
                }.padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
//                    .overlay(overlayView: CustomToast(toast: ToastModel(image: "alert", title:"Coming soon"), show: $showToast), show: $showToast)
            }
        }
    }
}




#Preview {
    HomeView()
}
