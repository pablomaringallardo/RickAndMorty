//
//  Font.swift
//  RickAndMorty
//
//  Created by Pablo Marín Gallardo on 21/5/24.
//

import SwiftUI

extension Font {
    
    enum CustomFont: String {
        case nunitoBold = "Nunito-Bold"
        case nunitoMedium = "Nunito-Medium"
        case nunitoRegular = "Nunito-Regular"
    }
    
    static func customFont(name: CustomFont, size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
}
