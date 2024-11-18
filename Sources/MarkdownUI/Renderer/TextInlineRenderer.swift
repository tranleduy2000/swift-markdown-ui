import SwiftUI
import LaTeXSwiftUI

@available(iOS 16, *)
extension Sequence where Element == InlineNode {
  @MainActor
  func renderText(
    baseURL: URL?,
    textStyles: InlineTextStyles,
    images: [String: Image],
    softBreakMode: SoftBreak.Mode,
    attributes: AttributeContainer,
    latexMode: LatexMode,
    font: Font,
    displayScale: CGFloat
  ) -> Text {
    var renderer = TextInlineRenderer(
      baseURL: baseURL,
      textStyles: textStyles,
      images: images,
      softBreakMode: softBreakMode,
      attributes: attributes,
      latexMode: latexMode,
      font: font,
      displayScale: displayScale
    )
    renderer.render(self)
    return renderer.result
  }
}

@available(iOS 16.0, *)
private struct TextInlineRenderer {
  var result = Text("")
  
  private let baseURL: URL?
  private let textStyles: InlineTextStyles
  private let images: [String: Image]
  private let softBreakMode: SoftBreak.Mode
  private let attributes: AttributeContainer
  private var shouldSkipNextWhitespace = false
  private var latexMode: LatexMode
  private var font: Font;
  private var displayScale: CGFloat;
  
  
  init(
    baseURL: URL?,
    textStyles: InlineTextStyles,
    images: [String: Image],
    softBreakMode: SoftBreak.Mode,
    attributes: AttributeContainer,
    latexMode: LatexMode,
    font: Font,
    displayScale: CGFloat
  ) {
    self.baseURL = baseURL
    self.textStyles = textStyles
    self.images = images
    self.softBreakMode = softBreakMode
    self.attributes = attributes
    self.latexMode = latexMode
    self.font = font;
    self.displayScale = displayScale
  }
  
  @MainActor
  mutating func render<S: Sequence>(_ inlines: S) where S.Element == InlineNode {
    for inline in inlines {
      self.render(inline)
    }
  }
  
  @MainActor
  private mutating func render(_ inline: InlineNode) {
    switch inline {
      case .text(let content):
        self.renderText(content)
      case .softBreak:
        self.renderSoftBreak()
      case .html(let content):
        self.renderHTML(content)
      case .image(let source, _):
        self.renderImage(source)
      default:
        self.defaultRender(inline)
    }
  }
  
  @MainActor
  private mutating func renderText(_ text: String) {
    var text = text
    
    if self.shouldSkipNextWhitespace {
      self.shouldSkipNextWhitespace = false
      text = text.replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression)
    }
    
    if latexMode == .enabled {
      let renderer = Renderer()
      let componentBlocks = renderer.renderSync(
        latex: text,
        unencodeHTML: false,
        parsingMode: .onlyEquations,
        processEscapes: false,
        errorMode: .original,
        font: self.font,
        displayScale: self.displayScale)
      
      for componentBlock in componentBlocks {
        for component in componentBlock.components {
          if component.type.isEquation {
            result = result + self.text(for: component, renderer: renderer, isEquationBlock: false)
          } else {
            self.defaultRender(.text(component.text))
          }
        }
      }
    } else {
      self.defaultRender(.text(text))
    }
  }
  
  /// Gets the `Text` view for the given component block.
  ///
  /// - Parameter block: The component block.
  /// - Returns: A `Text` view.
  @MainActor
  private func text(for component: Component, renderer: Renderer, isEquationBlock: Bool) -> Text {
    return renderer.convertToText(
      component: component,
      font: .body,
      displayScale: 1,
      renderingMode: .template,
      errorMode: .original,
      blockRenderingMode: .blockText,
      isInEquationBlock: isEquationBlock)
  }
  
  private mutating func renderSoftBreak() {
    switch self.softBreakMode {
      case .space where self.shouldSkipNextWhitespace:
        self.shouldSkipNextWhitespace = false
      case .space:
        self.defaultRender(.softBreak)
      case .lineBreak:
        self.shouldSkipNextWhitespace = true
        self.defaultRender(.lineBreak)
    }
  }
  
  private mutating func renderHTML(_ html: String) {
    let tag = HTMLTag(html)
    
    switch tag?.name.lowercased() {
      case "br":
        self.defaultRender(.lineBreak)
        self.shouldSkipNextWhitespace = true
      default:
        self.defaultRender(.html(html))
    }
  }
  
  private mutating func renderImage(_ source: String) {
    if let image = self.images[source] {
      self.result = self.result + Text(image)
    }
  }
  
  private mutating func defaultRender(_ inline: InlineNode) {
    self.result =
    self.result
    + Text(
      inline.renderAttributedString(
        baseURL: self.baseURL,
        textStyles: self.textStyles,
        softBreakMode: self.softBreakMode,
        attributes: self.attributes
      )
    )
  }
}
