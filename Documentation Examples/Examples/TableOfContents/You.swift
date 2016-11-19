import Foundation

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
