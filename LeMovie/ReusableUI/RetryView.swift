//
//  RetryView.swift
//  LeMovie
//
//  Created by Agus cahyono on 24/05/22.
//

import SwiftUI

public struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    public init(text: String, retryAction: @escaping () -> ()) {
        self.text = text
        self.retryAction = retryAction
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Try Again")
            }

        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(text: "An Error occured", retryAction: {
            
        })
    }
}
