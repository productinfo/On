import UIKit

public class SearchBarTarget: NSObject, UISearchBarDelegate {
  var textAction: StringAction?

  init(host: UISearchBar) {
    super.init()
    host.delegate = self
  }

  // MARK: - UISearchBarDelegate

  public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    textAction?(searchBar.text ?? "")
  }

  // MARK: - Public

  func text(_ action: @escaping StringAction) {
    self.textAction = action
  }
}

extension UISearchBar {
  private struct AssociatedKey {
    static var on = "on"
  }

  var on: SearchBarTarget {
    get {
      if let value = objc_getAssociatedObject(self, &AssociatedKey.on) as? SearchBarTarget {
        return value
      }

      let value = SearchBarTarget(host: self)
      objc_setAssociatedObject(self, &AssociatedKey.on, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      return value
    }
  }
}
