//
//  ActivityIndicatorView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 31.01.2021.
//

import SwiftUI

struct ActivityIndicatorView : UIViewRepresentable {
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIActivityIndicatorView {
        
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
}
