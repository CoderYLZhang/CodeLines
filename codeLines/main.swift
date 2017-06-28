//
//  main.swift
//  codeLines
//
//  Created by yinlong on 2017/6/27.
//  Copyright © 2017年 yinlong. All rights reserved.
//

import Foundation
// /Users/yinlong/Desktop/MYGit/codeLines/codeLines/String+Path.swift
// /Users/yinlong/Desktop/ziti/ziti/AppDelegate.h
let filePath = "/Users/yinlong/Desktop/ziti/ziti/AppDelegate.h"

let sumLines = CodeLines.process(filePath)

print("总行数: \(sumLines.total), 有效代码行数: \(sumLines.code), 注释: \(sumLines.note), 空行: \(sumLines.blank)")
// 总行数: 22, 有效代码行数: 12, 注释: 7, 空行: 3
