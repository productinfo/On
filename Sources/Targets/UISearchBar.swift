import UIKit

public extension Container where Host: UISearchBar {

  func text(_ action: @escaping StringAction) {
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

  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    action?(searchBar.text ?? "")
  }
}
