//
//  ResultView.swift
//  OuviFalar
//
//  Created by Danilo Araújo on 04/12/20.
//

import SwiftUI
import UIKit

struct ResultView: View {
    
    @ObservedObject var item: Search
    
    @State private var isShareSheetShowing = false
    
    @Binding var isRootViewActive: Bool
    
    var isInformationFromSharedExtension: Bool = false

    var body: some View {
        VStack{
            if item.information == .info{
                PositiveResultCard(searchText: item.text)
                    .padding()
            }
            else{
                NegativeResultCard(searchText: item.text)
                Spacer()
                    .frame(height: 85)
                
                Button(action: {
                    
                    isShareSheetShowing.toggle()
                    
                }, label: {
                    Text("Compartilhar")
                        .fontWeight(.medium)
                })
                .sheet(isPresented: $isShareSheetShowing, onDismiss: {
                    print("Dismiss")
                }, content: {
                    ActivityViewController(activityItems: ["Cuidado!\nChequei no Ouvi falar e \"\(item.text)\" tem indícios de ser fake news. Não assuma como verdade!"])
                })
                .foregroundColor(.black)
                .frame(width: 250, height: 60)
                .background(Color.lightYellowColor)
                .cornerRadius(8)
                .shadow(radius: 2, x:0, y:1)
                
                if (!isInformationFromSharedExtension) {
                    Button(action: { self.isRootViewActive = false }, label: {
                        Text("Fazer nova checagem")
                            .fontWeight(.medium)
                    })
                    .foregroundColor(.black)
                    .frame(width: 250, height: 60)
                    .background(Color("lightGray2"))
                    .cornerRadius(8)
                    .shadow(color: .gray, radius: 2, x: 0, y: 1)
                    .padding(.top, 12)
                }
            }
        }
        .onAppear{
//            let userDefaults = UserDefaults(suiteName: "group.br.ufpe.academy.OuviFalar")
//            userDefaults?.setValue("", forKey: "start-text-key")
        }
        .navigationBarHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(item: Search(text: "Coringa mata"), isRootViewActive: .constant(false))
    }
}


struct ActivityViewController: UIViewControllerRepresentable {
    
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
    
}

//struct LastNews: View {
//    var body: some View {
//        HStack {
//            Text("Notícias sobre o tema")
//                .font(.headline)
//            Spacer()
//        }
//
//        .padding([.top, .leading])
//
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 1) {
//
//                ForEach(0..<(history.count)){ index in
//
//                    VStack{
//                        HStack {
//                            Text(verbatim: history[index].title)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                                .padding([.top, .leading, .trailing])
//                            Image(systemName: "xmark.circle")
//                                .padding()
//                                .foregroundColor(.red)
//
//                            Spacer()
//                        }
//
//
//                        Text(verbatim: history[index].description)
//                            .padding([.leading, .bottom, .trailing])
//                            .padding(.top, 5)
//                            .foregroundColor(.blue)
//                    }
//
//                    .frame(maxWidth: 320)
//                    .background(Color.primaryColor)
//                    .cornerRadius(20)
//                    .padding()
//
//                }
//            }.frame(height: 200)
//        }
//    }
//}
