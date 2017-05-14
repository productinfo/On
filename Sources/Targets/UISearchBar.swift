import UIKit

public extension TargetContainer where T: UISearchBar {

  func change(_ action: @escaping StringAction) {
    let target = SearchBarTarget(host: host, action: action)

    self.searchBarTarget = target
  }
}

class SearchBarTarget: NSObject, UISearchBarDelegate {
  var action: StringAction?

  init(host: UISearchBar, action: @escaping StringAction) {
    super.init()

    self.action = action
    host.delegate = self
  }

  // MARK: - UISearchBarDelegate

  public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    action?(searchBar.text ?? "")
  }
}
