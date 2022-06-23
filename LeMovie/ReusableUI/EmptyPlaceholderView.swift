//
//  EmptyPlaceholderView.swift
//  LeMovie
//
//  Created by Agus cahyono on 24/05/22.
//

import SwiftUI

public struct EmptyPlaceholderView: View {
    
    let text: String
    let image: Image?
    
    public init(text: String, image: Image?) {
        self.text = text
        self.image = image
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image = image {
                image
                    .imageScale(.large)
                    .font(.system(size: 32))
            }
            Text(text)
            Spacer()
        }
    }
    
}

struct EmptyPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPlaceholderView(text: "No Bookmark", image: Image(systemName: "newspaper"))
    }
}
