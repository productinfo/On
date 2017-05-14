import Foundation

public class Container<Host>: NSObject {
  let host: Host

  init(host: Host) {
    self.host = host
  }

  var controlTarget: ControlTarget?
  var buttonTarget: ButtonTarget?
  var sliderTarget: SliderTarget?
  var gestureTarget: GestureTarget?
  var datePickerTarget: DatePickerTarget?
  var barButtonItemTarget: BarButtonItemTarget?
  var searchBarTarget: SearchBarTarget?
  var textFieldTarget: TextFieldTarget?
  var textViewTarget: TextViewTarget?
  var timerTarget: TimerTarget?
  let keyPathTarget = KeyPathTarget()
}
