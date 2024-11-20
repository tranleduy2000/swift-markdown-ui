import SwiftUI
import LaTeXSwiftUI

@available(iOS 16.0, *)
struct CodeBlockView: View {
  @Environment(\.theme.codeBlock) private var codeBlock
  @Environment(\.codeSyntaxHighlighter) private var codeSyntaxHighlighter
  @Environment(\.latexMode) private var latexMode
  
  private let fenceInfo: String?
  private let content: String
  
  init(fenceInfo: String?, content: String) {
    self.fenceInfo = fenceInfo
    self.content = content.hasSuffix("\n") ? String(content.dropLast()) : content
  }
  
  var body: some View {
    self.codeBlock.makeBody(
      configuration: .init(
        language: self.fenceInfo,
        content: self.content,
        label: .init(self.label)
      )
    )
  }
  
  @ViewBuilder
  private var label: some View {
    if latexMode == .enabled && fenceInfo == "renderlatex" {
      
      LaTeX("$$ " + self.content.trimmingCharacters(in: .whitespacesAndNewlines) + " $$" )
        .renderingStyle(.wait)
        .blockMode(.blockText)
        .errorMode(.original)
      
      
    } else {
      self.codeSyntaxHighlighter.highlightCode(self.content, language: self.fenceInfo)
        .textStyleFont()
        .textStyleForegroundColor()
    }
  }
}
