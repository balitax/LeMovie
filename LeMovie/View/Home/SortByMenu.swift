//
//  SortByMenu.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI
import GSNetwork

struct SortByMenu: View {
    
    @State var sorts: [MovieListEndpoint]
    var onSelectedSort: (MovieListEndpoint) -> ()
    
    var body: some View {
        VStack {
            //MARK: - BODY TOP
            HStack {
                Text("Our Movies")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer()
                Menu {
                    ForEach(sorts, id: \.self) { text in
                        Button {
                            onSelectedSort(text)
                        } label: {
                            Text(text.description).tag(text.description)
                        }

                    }
                } label: {
                    HStack(spacing: 3) {
                        Text("Sort by")
                            .font(.body)
                            .fontWeight(.medium)
                        Image(systemName: "chevron.down")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.primary)
                }
            } // END BODY TOP
            .padding(.top, 10)
            .padding(.horizontal)
        }
    }
}

struct SortByMenu_Previews: PreviewProvider {
    static var previews: some View {
        SortByMenu(sorts: [], onSelectedSort: { _ in })
    }
}
