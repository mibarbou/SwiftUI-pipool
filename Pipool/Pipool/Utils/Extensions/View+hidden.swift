//
//  View+hidden.swift
//  Pipool
//
//  Created by Michel Barbou Salvador on 03/11/2020.
//

import SwiftUI

extension View {
   func visibility(hidden: Binding<Bool>) -> some View {
      modifier(VisibilityStyle(hidden: hidden))
   }
}

struct VisibilityStyle: ViewModifier {
   
   @Binding var hidden: Bool
   func body(content: Content) -> some View {
      Group {
         if hidden {
            content.hidden()
         } else {
            content
         }
      }
   }
}
