//
//  LabelDescriptionView.swift
//  watshealth
//
//  Created by mac on 11/8/24.
//

import SwiftUI

struct LabelDescriptionView: View {
    var label: String
    var description: String

    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading) // Align label to the left
            
            Text(description)
                .font(.body)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .trailing) // Align description to the right
        }
        .padding()
    }
}

#Preview {
    LabelDescriptionView(label: "Label", description: "Description")
                .previewLayout(.sizeThatFits)
}
