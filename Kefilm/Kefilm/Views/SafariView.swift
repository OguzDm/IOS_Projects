//
//  SafariView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 9.02.2021.
//

import Foundation
import SafariServices
import SwiftUI


struct SafariView: UIViewControllerRepresentable {
    
    let url:URL
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
        
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
}
