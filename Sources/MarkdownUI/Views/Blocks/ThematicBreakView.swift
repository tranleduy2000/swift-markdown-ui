import SwiftUI

@available(iOS 16, *)
struct ThematicBreakView: View {
  @Environment(\.theme.thematicBreak) private var thematicBreak

  var body: some View {
    self.thematicBreak.makeBody(configuration: ())
  }
}
