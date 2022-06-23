//
//  SafariView.swift
//  LeMovie
//
//  Created by Agus cahyono on 24/05/22.
//

import SwiftUI
import SafariServices

public struct SafariView: UIViewControllerRepresentable {
    
    public let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public func makeUIViewController(context: Context) -> some SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
