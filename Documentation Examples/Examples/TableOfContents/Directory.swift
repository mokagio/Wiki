struct Directory {
  let name: String
  let sections: [Section]
}

extension Directory {

  static let documentation: Directory = {
    return Directory(
      name: "Documentation",
      sections: [
        "Setting Up Tests in Your Xcode Project",
        "Effective Tests Using XCTest: Arrange, Act, and Assert",
        "Installing Quick",
        "Organized Tests with Quick Examples and Example Groups",
        ]
    )
  }()
}
