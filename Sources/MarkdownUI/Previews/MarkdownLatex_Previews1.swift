//
//  File.swift
//  swift-markdown-ui
//
//  Created by duy on 18/11/24.
//

import Foundation
import SwiftUI

@available(iOS 16, *)
public struct MarkdownLatex_Previews1: PreviewProvider {
  
  static let markdown2 =
            #"""
            \[
            \begin{align}
            a^2 + b^2 &= c^2 \\
            \int_a^b f(x) \, dx &= F(b) - F(a) \\
            \lim_{x \to 0} \frac{\sin(x)}{x} &= 1
            \end{align}
            \]
            """#.markdownUiLatexString()
  
  static let markdown3 =
            #"""
            # Key Integral and Derivative Formulas
            
            This document lists fundamental **integral** and **derivative** formulas used in calculus.
            
            ## Basic Derivatives
            
            1. **Power Rule**  
            $$
            \frac{d}{dx}(x^n) = n x^{n-1}
            $$
            
            2. **Exponential Functions**  
            $$
            \frac{d}{dx}(e^x) = e^x
            $$
            """#.markdownUiLatexString()
  
  public static var previews: some View {
    ScrollView {
      
      Markdown(markdown3)
        .markdownTheme(.gitHub)
        .markdownLatexMode(.enabled)
        .padding(.horizontal)
      
      Divider()
      
      Markdown(markdown2)
        .markdownTheme(.gitHub)
        .markdownLatexMode(.enabled)
        .font(.largeTitle)
        .padding(.horizontal)
    }
  }
}
