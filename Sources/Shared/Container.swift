import Foundation

public class Container<Host>: NSObject {
  let host: Host

  init(host: Host) {
    self.host = host
  }

  // Just to keep the targets around
#if os(iOS) || os(tvOS)
  var controlTarget: ControlTarget?
  var buttonTarget: ButtonTarget?
  var sliderTarget: SliderTarget?
  var gestureTarget: GestureTarget?
  var datePickerTarget: DatePickerTarget?
  var barButtonItemTarget: BarButtonItemTarget?
  var searchBarTarget: SearchBarTarget?
  var textFieldTargets = [TextFieldTarget]()
  var textViewTarget: TextViewTarget?
  var timerTarget: TimerTarget?
  let keyPathTarget = KeyPathTarget()
#elseif os(OSX)
  var buttonTarget: ButtonTarget?
#endif
}
