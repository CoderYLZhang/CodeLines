//
//  YLDragDropView.swift
//  YLFileCodeLines
//
//  Created by zero.zhang on 2020/11/11.
//

import Cocoa
import SnapKit

protocol YLDragDropViewDelegate: class {
    func dragDropFilePathList(_ filePathList: [String])
}

class YLDragDropView: NSView {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        registerForDraggedTypes([draggedType])
        wantsLayer = true
        layer?.backgroundColor = NSColor.white.withAlphaComponent(0.1).cgColor
        
        addSubview(tipsLabel)
        tipsLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
    }
    
    /// 当文件拖入到view中
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        return NSDragOperation.copy
    }
    
    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let pboard = sender.draggingPasteboard
        
        // Extract the required NSFilenamesPboardType data from the clipboard
        // 从粘贴板中提取需要的NSFilenamesPboardType数据
        guard let filePathList = pboard.propertyList(forType: draggedType) as? [String] else { return false }
        
        // 将文件数路径组通过代理回调出去
        delegate?.dragDropFilePathList(filePathList)
        return true
    }
    
    //MARK:- Property
    
    weak var delegate: YLDragDropViewDelegate?
    
    var draggedType: NSPasteboard.PasteboardType {
        return NSPasteboard.PasteboardType("NSFilenamesPboardType")
    }
    
    lazy var tipsLabel: NSTextField = {
        let label = NSTextField()
        label.alignment = .center
        label.isBordered = false
        label.isEditable = false
        label.isBezeled = false
        label.drawsBackground = false
        label.stringValue = "将文件(夹)拖拽到此处"
        return label
    }()

}
