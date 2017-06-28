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
print(".h文件数: \(sumLines.fileH), .m文件数: \(sumLines.fileM), .Swift文件数: \(sumLines.fileSwift)")

// GP
// 总行数: 188178, 有效代码行数: 136394, 注释: 28116, 空行: 23668 不包括 Pods .h文件数: 687, .m文件数: 588, .Swift文件数: 0
// 总行数: 245862, 有效代码行数: 167872, 注释: 45797, 空行: 32193 包括 Pods   .h文件数: 881, .m文件数: 734, .Swift文件数: 1

// ZT
// 总行数: 126963, 有效代码行数: 96933, 注释: 17664, 空行: 12366 不包括 Pods .h文件数: 415, .m文件数: 323, .Swift文件数: 336
// 总行数: 186806, 有效代码行数: 128796, 注释: 36939, 空行: 21071 包括 Pods  .h文件数: 564, .m文件数: 406, .Swift文件数: 475
//



