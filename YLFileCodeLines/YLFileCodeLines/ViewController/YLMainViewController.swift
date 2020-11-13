//
//  YLMainViewController.swift
//  YLFileCodeLines
//
//  Created by yinlong on 2020/11/11.
//

import Cocoa
import SnapKit

class YLMainViewController: NSViewController, YLDragDropViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    func setupSubviews() {
        
        let window = NSApplication.shared.windows.first
        var frame = window?.frame ?? .zero
        frame.size = CGSize(width: 500, height: 350)
        window?.setFrame(frame, display: true, animate: false)
        
        view.addSubview(dragDropView)
        dragDropView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(40)
        }
    }
    
    //MARK:- YLDragDropViewDelegate
    func dragDropFilePathList(_ filePathList: [String]) {
        
        filePathList.forEach { (path) in
            let codeLines = YLCodeLines()
            codeLines.ignoreFolders = ["Pods"] // 要忽略的文件夹名
            let sumLines = codeLines.process(path)

            print("总行数: \(sumLines.total), 有效代码行数: \(sumLines.code), 注释: \(sumLines.note), 空行: \(sumLines.blank)")
            print(".h文件数: \(sumLines.fileH), .m文件数: \(sumLines.fileM), .Swift文件数: \(sumLines.fileSwift)")

            print("overflowFile: ===============")

            for tuple in codeLines.overflowFile {
                print("文件: \(tuple.0), 总行数: \(tuple.1.total), 有效代码行数: \(tuple.1.code), 注释: \(tuple.1.note), 空行: \(tuple.1.blank)")
            }
        }
    }
    
    //MARK:- Property
    
    lazy var dragDropView: YLDragDropView = {
        let view = YLDragDropView()
        view.delegate = self
        return view
    }()
    
}

