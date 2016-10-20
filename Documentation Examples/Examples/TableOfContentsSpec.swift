import Quick
import Nimble

class TableOfContentsSpec: QuickSpec {
  override func spec() {
    describe("the 'Documentation' directory") {
      it("has everything you need to get started") {
        let sections = Directory.documentation.sections
        expect(sections).to(contain("Organized Tests with Quick Examples and Example Groups"))
        expect(sections).to(contain("Installing Quick"))
      }

      context("if it doesn't have what you're looking for") {
        it("needs to be updated") {
          let you = You(awesome: true)
          you.submitIssue(description: "Not enough people know about Quick!", completion: .none)
          expect{you.submittedAnIssue}.toEventually(beTruthy())
        }
      }
    }
  }
}

typealias Section = String

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


// `You` should definitely be a class, the same way a dog should be a class.
// See: https://realm.io/news/andy-matuschak-controlling-complexity/
class You {
  let isAwesome: Bool
  var submittedAnIssue: Bool = false

  init(awesome: Bool) {
    self.isAwesome = awesome
  }

  // Note: it would be better for the completion parameter to not be optional,
  // and to uses a `Result` type rather than an optional error, but bear with
  // us, these are examples right? ;)
  // See: https://github.com/antitypical/Result
  func submitIssue(
    description: String,
    completion: ((Error?) -> ())?) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
      guard let strongSelf = self else { return }

      strongSelf.submittedAnIssue = true

      completion?(.none)
    }
  }
}
