//
//  main.swift
//  codeLines
//
//  Created by yinlong on 2017/6/27.
//  Copyright © 2017年 yinlong. All rights reserved.
//

import Foundation

let filePath = "要检查的目录"

//CodeLines.ignoreFolders = ["Pods"] // 要忽略的文件夹名
let sumLines = CodeLines.process(filePath)

print("总行数: \(sumLines.total), 有效代码行数: \(sumLines.code), 注释: \(sumLines.note), 空行: \(sumLines.blank)")


// 总行数: 188178, 有效代码行数: 134694, 注释: 29816, 空行: 23668 不包括 Pods
// 总行数: 245862, 有效代码行数: 165923, 注释: 47752, 空行: 32187 包括 Pods
