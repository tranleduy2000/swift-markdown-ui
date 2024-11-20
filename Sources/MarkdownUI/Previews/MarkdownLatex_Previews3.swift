//
//  File.swift
//  swift-markdown-ui
//
//  Created by duy on 18/11/24.
//

import Foundation
import SwiftUI

@available(iOS 16, *)
struct MarkdownLatex_Previews3: PreviewProvider {
  
  static var previews: some View {
    ScrollView {
      
//      Markdown(
//        #"""
//        Cấp số cộng \( u_n \) thỏa mãn:
//        
//        - \( u_1 = 4 \)
//        - \( u_3 = 10 \)
//        
//        Trong cấp số cộng, công thức tổng quát của số hạng thứ \( n \) là:
//        \[ u_n = u_1 + (n-1)d \]
//        Trong đó \( d \) là công sai.
//        
//        Áp dụng cho \( u_3 \):
//        \[ u_3 = u_1 + 2d \]
//        \[ 10 = 4 + 2d \]
//        \[ 2d = 6 \]
//        \[ d = 3 \]
//        
//        **Vậy công sai của cấp số cộng là 3.**
//        """#.markdownUiLatexString()
//      )
//      .markdownLatexMode(.enabled)
//      .markdownTheme(.docC)
//      .markdownLatexMode(.enabled)
//      .padding(.horizontal)
      
      Markdown(
        #"""
        Cấp số cộng \( u_n \) thỏa mãn:
        
        - \( u_1 = 4 \)
        - \( u_3 = 10 \)
        
        Trong cấp số cộng, công thức tổng quát của số hạng thứ \( n \) là:
        \[ u_n = u_1 + (n-1)d \]
        Trong đó \( d \) là công sai.
        
        Áp dụng cho \( u_3 \):
        \[ 
        u_3 = u_1 + 2d \\
        10 = 4 + 2d\\
        2d = 6 \\
        d = 3
        \]
        
        **Vậy công sai của cấp số cộng là 3.**
        """#.markdownUiLatexString()
      )
      .markdownLatexMode(.enabled)
      .markdownTheme(.docC)
      .markdownLatexMode(.enabled)
      .padding(.horizontal)
    }
  }
}
