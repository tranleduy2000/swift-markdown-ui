//
//  String+Latex.swift
//  swift-markdown-ui
//
//  Created by duy on 18/11/24.
//
import Foundation

public extension String {
  
  private func findCodeBlocks() {
    
  }
  
  func markdownUiLatexString() -> String {
    
    var str: String = self;
    
    // extract ```...``` and `...`
    var codeBlockList = [(String, String)]()
    var codeList = [(String, String)]()
    do {
      let codeBlockRegex = try! NSRegularExpression.init(pattern: "```.*?\n([\\s\\S]*?)\n```", options: [])
      var codeBlockCount = 0;
      while true {
        let firstMatch = codeBlockRegex.rangeOfFirstMatch(in: str, range: NSRange(location: 0, length: str.count));
        if firstMatch.location == NSNotFound {
          break;
        }
        let key = "<<<<<<<codeBlock\(codeBlockCount)>>>>>>>"
        codeBlockCount += 1;
        let range = Range.init(firstMatch, in: str)!;
        let codeBlockValue = String(str[range])
        str.replaceSubrange(range, with: key)
        
        codeBlockList.append((key, codeBlockValue))
      }
    }
    
    do {
      let codeRegex = try! NSRegularExpression.init(pattern: "`[^`]*`", options: [])
      var codeCount = 0;
      while true {
        let firstMatch = codeRegex.rangeOfFirstMatch(in: str, range: NSRange(location: 0, length: str.count));
        if firstMatch.location == NSNotFound {
          break;
        }
        let key = "<<<<<<<code\(codeCount)>>>>>>>"
        codeCount += 1;
        let range = Range.init(firstMatch, in: str)!;
        let codeBlockValue = String(str[range])
        str.replaceSubrange(range, with: key)
        
        codeList.append((key, codeBlockValue))
      }
    }
    
    str = str
      .replacingOccurrences(of: "\\(", with: "\\\\(") // swift-cmark escape parse \( as (
      .replacingOccurrences(of: "\\)", with: "\\\\)") // swift-cmark escape parse \) as )
      .replacingOccurrences(of: "\\[", with: "\n```renderlatex\n")
      .replacingOccurrences(of: "\\]", with: "\n```\n")
 
    do {
      let doubleDollarLatexRegex = try! NSRegularExpression.init(pattern: "\\$\\$\n?([\\s\\S]*?)\n?\\$\\$", options: [])
    
      while true {
        let matches = doubleDollarLatexRegex.matches(in: str, range: NSRange(location: 0, length: str.count));
        if matches.isEmpty {
          break;
        }
        
        let firstMatch = matches[0];
        
        
        let range = Range.init(firstMatch.range, in: str)!;
        let range1 = Range.init(firstMatch.range(at: 1), in: str)!;
       
        let dollarLatexValue = String(str[range1])
        str.replaceSubrange(range, with:
                            """
                            
                            ```renderlatex
                            \(dollarLatexValue)
                            ```
                            
                            """)
      }
    }
    
    codeBlockList.forEach {
      str = str.replacingOccurrences(of: $0.0, with: $0.1)
    }
    codeList.forEach {
      str = str.replacingOccurrences(of: $0.0, with: $0.1)
    }
    
    return str;
  }
}
