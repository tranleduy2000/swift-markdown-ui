//
//  File.swift
//  swift-markdown-ui
//
//  Created by duy on 18/11/24.
//

import Foundation
import SwiftUI

@available(iOS 16, *)
struct MarkdownLatex_Previews2: PreviewProvider {
  
  static var previews: some View {
    ScrollView {
      Markdown(
            #"""
            # Key Integral and Derivative Formulas
            
            This document lists fundamental **integral** and **derivative** formulas used in calculus.
            
            ## Basic Derivatives
            
            1. **Power Rule**  
            \[
            \frac{d}{dx}(x^n) = n x^{n-1}
            \]
            
            2. **Exponential Functions**  
            \[
            \frac{d}{dx}(e^x) = e^x
            \]
            \[
            \frac{d}{dx}(a^x) = a^x \ln(a)
            \]
            
            3. **Logarithmic Functions**  
            \[
            \frac{d}{dx}(\ln(x)) = \frac{1}{x}
            \]
            \[
            \frac{d}{dx}(\log_a(x)) = \frac{1}{x \ln(a)}
            \]
            
            4. **Trigonometric Functions**  
            \[
            \frac{d}{dx}(\sin(x)) = \cos(x)
            \]
            \[
            \frac{d}{dx}(\cos(x)) = -\sin(x)
            \]
            \[
            \frac{d}{dx}(\tan(x)) = \sec^2(x)
            \]
            
            5. **Inverse Trigonometric Functions**  
            \[
            \frac{d}{dx}(\arcsin(x)) = \frac{1}{\sqrt{1 - x^2}}
            \]
            \[
            \frac{d}{dx}(\arccos(x)) = -\frac{1}{\sqrt{1 - x^2}}
            \]
            \[
            \frac{d}{dx}(\arctan(x)) = \frac{1}{1 + x^2}
            \]
            
            ## Basic Integrals
            
            1. **Power Rule (for Integration)**  
            \[
            \int x^n \, dx = \frac{x^{n+1}}{n+1} + C, \quad (n \neq -1)
            \]
            
            2. **Exponential Functions**  
            \[
            \int e^x \, dx = e^x + C
            \]
            \[
            \int a^x \, dx = \frac{a^x}{\ln(a)} + C
            \]
            
            3. **Logarithmic Function**  
            \[
            \int \frac{1}{x} \, dx = \ln |x| + C
            \]
            
            4.
            
            $$
            1 + 4 = 5
            $$
            """#
              .markdownUiLatexString()
      )
      .markdownTheme(.gitHub)
      .markdownLatexMode(.enabled)
      .padding(.horizontal)
    }
  }
}
