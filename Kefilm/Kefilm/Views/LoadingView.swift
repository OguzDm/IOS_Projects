//
//  LoadingView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 31.01.2021.
//

import SwiftUI

struct LoadingView: View {
    let isLoading : Bool
    let error: NSError?
    let retryAction : (() ->())?
    
    
    var body: some View {
        
        Group {
            
            if isLoading {
                HStack {
                    Spacer()
                    ActivityIndicatorView()
                    Spacer()
                    
                }
                
            }
            else if error != nil {
                HStack {
                    Spacer()
                    VStack(spacing:4){
                        Text(error!.localizedDescription).font(.headline)
                        if self.retryAction != nil {
                            Button(action: self.retryAction!, label: {
                                Text("Retry")
                            })
                            .foregroundColor(Color(UIColor.systemBlue))
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true, error: nil, retryAction: nil)
    }
}
