using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class garmin_dead_pixelInputDelegate extends Ui.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }
    
    function onKey(keyEvent) {
        System.println(keyEvent.getKey());  // e.g. KEY_MENU = 7
        System.println(keyEvent.getType()); // e.g. PRESS_TYPE_DOWN = 0
        return true;
    }
}