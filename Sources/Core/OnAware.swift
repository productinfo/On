import Foundation

public protocol OnAware {
  associatedtype OnAwareHostType

  var on: Container<OnAwareHostType> { get set }
}

extension OnAware {
  public var on: Container<Self> {
    get {
      return Container(host: self)
    }
    set {

    }
  }
}

extension NSObject: OnAware { }
