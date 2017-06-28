//
//  CodeLines.swift
//  codeLines
//
//  Created by yinlong on 2017/6/28.
//  Copyright © 2017年 yinlong. All rights reserved.
//

import Foundation

typealias LinesTuple = (total: Int, code: Int, note: Int, blank: Int)

struct CodeLines {
    static func process(_ path : String) -> LinesTuple {
        
        let fileManager = FileManager.default
        var isDirectory : ObjCBool = false
        
        fileManager.fileExists(atPath: path, isDirectory: &isDirectory)
        
        if isDirectory.boolValue { // 是目录
            
            let fileArr = try! fileManager.contentsOfDirectory(atPath: path)
            var sumlines : LinesTuple = (0, 0, 0, 0)
            for file in fileArr {
                let temp = CodeLines.process("\(path)/\(file)")
                sumlines = (sumlines.0 + temp.0, sumlines.1 + temp.1, sumlines.2 + temp.2, sumlines.3 + temp.3)
            }
            return sumlines
        }
        // 文件
        let fileExtension = path.pathExtension
        let fileExtensions = ["h","m","swift"]
        guard fileExtensions.contains(fileExtension) else {
            return (0, 0, 0, 0)
        }
        
        let text : NSString = try! NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
        let arr = text.components(separatedBy: "\n")
        var total = 0 // 总行数
        var code = 0  // 有效代码行数
        var note = 0  // 注释
        var blank = 0 // 空行
        
        var isStar = false
        
        for string in arr {
            total += 1
            
            if string.hasSuffix("*/") {
                note += 1
                isStar = false
                continue
            }
            
            if string.contains("/*") {
                note += 1
                isStar = true
                continue
            }
            else if isStar {
                note += 1
                continue
            }
            
            if string.hasPrefix("//") {
                note += 1
                continue
            }
            
            if string.hasPrefix(" ") && string.contains("//") {
                note += 1
                continue
            }
            
            if string.characters.count == 0 {
                blank += 1
                continue
            }
            code += 1
        }
        
        print("文件: \(path.lastPathComponent), 总行数: \(total), 有效代码行数: \(code), 注释: \(note), 空行: \(blank)")
        return (total, code, note, blank)
    }
}
