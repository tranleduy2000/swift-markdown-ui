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
  
  static let markdown =
            #"""
            # Complex Markdown and LaTeX with Links and Images
            
            ## Introduction
            
            This document combines **Markdown** with LaTeX, links, images, lists, and tables. We will cover both *inline* and **block-level** LaTeX expressions, as well as other Markdown features.
            
            For reference on LaTeX syntax, check out the [Overleaf Documentation](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes).
            
            Here's an inline equation for mass-energy equivalence: \( E = mc^2 \).
            
            ![Einstein Image](https://upload.wikimedia.org/wikipedia/commons/d/d3/Albert_Einstein_Head.jpg "Albert Einstein")
            
            ### Key Concepts
            
            1. **Energy** is defined by:
            - \( E = mc^2 \) — Einstein's formula for energy.
            - \( W = F \cdot d \) — Work as force times distance.
            
            2. **Probability** theory with **binomial distribution**:
            - The probability of \(k\) successes in \(n\) trials is:
            \[
            P(X = k) = \binom{n}{k} p^k (1 - p)^{n - k}
            \]
            - Where:
            - \( n \) = number of trials
            - \( k \) = number of successes
            - \( p \) = probability of success
            
            ### Detailed Table with Math and Links
            
            The following table shows formulas for common **statistical measures** and links to their Wikipedia entries:
            
            | Measure                | Formula                                                        | Reference                       |
            |------------------------|----------------------------------------------------------------|---------------------------------|
            | Mean                   | \( \mu = \frac{1}{N} \sum_{i=1}^{N} x_i \)                     | [Mean](https://en.wikipedia.org/wiki/Mean) |
            | Variance               | \( \sigma^2 = \frac{1}{N} \sum_{i=1}^{N} (x_i - \mu)^2 \)      | [Variance](https://en.wikipedia.org/wiki/Variance) |
            | Standard Deviation     | \( \sigma = \sqrt{\sigma^2} \)                                 | [Standard Deviation](https://en.wikipedia.org/wiki/Standard_deviation) |
            | Covariance             | \( \text{Cov}(X, Y) = \frac{1}{N} \sum (x_i - \bar{X})(y_i - \bar{Y}) \) | [Covariance](https://en.wikipedia.org/wiki/Covariance) |
            
            ### Differential Equations
            
            A first-order linear differential equation:
            \[
            \frac{dy}{dx} + P(x)y = Q(x)
            \]
            
            The integrating factor to solve it:
            \[
            \mu(x) = e^{\int P(x) \, dx}
            \]
            
            ### Multiline Equations
            
            Here are some multi-line equations:
            
            \[
            \begin{align}
            a^2 + b^2 &= c^2 \\
            \int_a^b f(x) \, dx &= F(b) - F(a) \\
            \lim_{x \to 0} \frac{\sin(x)}{x} &= 1
            \end{align}
            \]
            
            ---
            
            ### Rendering Tips
            
            To render:
            
            1. **Markdown to HTML**: This will convert headings, lists, tables, links, and images.
            2. **LaTeX Rendering**: Apply LaTeX processing to handle elements marked by `\(...\)`, `$$...$$`, or `\[...\]`.
            
            This will ensure Markdown structure is respected while LaTeX elements render correctly.
            
            """#.markdownUiLatexString()
  
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
      
      Markdown(markdown)
        .markdownTheme(.gitHub)
        .markdownLatexMode(.enabled)
        .padding(.horizontal)
      
      Markdown(markdown)
        .markdownTheme(.gitHub)
        .markdownLatexMode(.enabled)
        .padding(.horizontal)
        .font(.largeTitle)
      
      Markdown(markdown2)
        .markdownTheme(.gitHub)
        .markdownLatexMode(.enabled)
        .font(.largeTitle)
        .padding(.horizontal)
    }
  }
}
