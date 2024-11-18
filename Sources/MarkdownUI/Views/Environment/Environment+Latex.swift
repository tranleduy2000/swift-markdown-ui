import SwiftUI


public enum LatexMode {
  case enabled, disabled
}

extension EnvironmentValues {
  var latexMode: LatexMode {
    get { self[LatexModeEnabledKey.self] }
    set { self[LatexModeEnabledKey.self] = newValue }
  }
}

private struct LatexModeEnabledKey: EnvironmentKey {
  static let defaultValue: LatexMode = .disabled
}


extension View {
  /// Sets the soft break mode for inline texts in a view hierarchy.
  ///
  /// - parameter softBreakMode: If set to `space`, treats all soft breaks as spaces, keeping sentences whole. If set to `lineBreak`, treats soft breaks as full line breaks
  ///
  /// - Returns: A view that uses the specified soft break mode for itself and its child views.
  public func markdownLatexMode(_ latexMode: LatexMode) -> some View {
    self.environment(\.latexMode, latexMode)
  }
}
