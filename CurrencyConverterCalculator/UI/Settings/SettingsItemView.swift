//
//  SettingsItemView.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 17/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//
import SwiftUI

struct SettingsItemView: View {
    @ObservedObject var item: Currency
    var function: () -> Void
    
    var body: some View {
        HStack {
            Image(item.name.lowercased())
                .shadow(radius: 3)
            Text(item.name).frame(width: 45)
            Text(item.longName).font(.footnote)
            Text(item.symbol).font(.footnote)
            Spacer()
            Image(systemName: $item.isActive.wrappedValue ? "checkmark.circle.fill" : "circle")
        }
        .onTapGesture {
            self.$item.isActive.wrappedValue.toggle()
            function()
        }
        .lineLimit(1)
    }
}

#if DEBUG
struct SettingsItemViewPreviews: PreviewProvider {
    static var previews: some View {
        SettingsItemView(item: Currency(), function: {})
            .previewLayout(.fixed(width: 300, height: 36))
    }
}
#endif
