//
//  Document.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-22.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var modus: UTType {
        UTType(importedAs: "com.ModusManager.modus")
    }
}

final class DocumentTestDocument: ReferenceFileDocument {
    
    typealias Snapshot = ModusFile
    
    @Published var modlist: ModusFile
    
    static var readableContentTypes: [UTType] { [.modus] }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.modlist = try JSONDecoder().decode(ModusFile.self, from: data)
    }
    
    func snapshot(contentType: UTType) throws -> ModusFile {
        modlist // Make a copy.
    }
    
    init() {
        modlist = ModusFile(game: .minecraft, version: "1.19.4")
    }
    
    func fileWrapper(snapshot: ModusFile, configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(snapshot)
        let fileWrapper = FileWrapper(regularFileWithContents: data)
        return fileWrapper
    }
    
    func setVersion(_ version: String, undoManager: UndoManager? = nil) {
        modlist.version = version
        
        undoManager?.registerUndo(withTarget: self) { doc in
            // Because it calls itself, this is redoable, as well.
            doc.setVersion(version, undoManager: undoManager)
        }
    }
}
