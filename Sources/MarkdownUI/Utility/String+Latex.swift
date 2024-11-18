//
//  String+Latex.swift
//  swift-markdown-ui
//
//  Created by duy on 18/11/24.
//

public extension String {
  
  func markdownUiLatexString() -> String {
    
    let str = self
      .replacingOccurrences(of: "\\(", with: "\\\\(") // swift-cmark escape parse \( as (
      .replacingOccurrences(of: "\\)", with: "\\\\)") // swift-cmark escape parse \) as )
      .replacingOccurrences(of: "\\[", with: "```renderlatex")
      .replacingOccurrences(of: "\\]", with: "```")
    
    let chars = Array(str);
    
    var newStr = ""
    var doubleDollarBlockStr = ""; //$$...$$
    
    var i = 0
    var inDollarBlock = false;
    while i < chars.count {
      let current = chars[i];
      let next = i < chars.count - 1 ? chars[i + 1] : nil;
      
      // check escape
      // \$$ Text $$
      if current == "\\" && next == "$" {
        newStr += "\\$";
        i += 2;
        
        let nextNext = i < chars.count ? chars[i] : nil;
        if nextNext == "$" {
          newStr += "$";
          i += 1;
        }
      } else if current == "$" && next == "$" {
        
        if inDollarBlock {
          inDollarBlock = false;
          newStr += "\n```renderlatex\n\(doubleDollarBlockStr)\n```\n"
          doubleDollarBlockStr = ""
        } else {
          inDollarBlock = true;
        }
        
        i += 2;
        
      } else {
        if inDollarBlock {
          doubleDollarBlockStr.append(current)
        } else {
          newStr.append(current);
        }
        i += 1;
      }
    }
    
    if !doubleDollarBlockStr.isEmpty {
      newStr += "\n```renderlatex\n\(doubleDollarBlockStr)\n```\n"
      doubleDollarBlockStr = ""
    }
    
    return newStr;
  }
}
