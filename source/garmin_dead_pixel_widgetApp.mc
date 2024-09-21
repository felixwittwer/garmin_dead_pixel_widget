import Toybox.Application;
import Toybox.Lang;
using Toybox.WatchUi as Ui;

class garmin_dead_pixel_widgetApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView(){
        return [ new garmin_dead_pixel_widgetView() ];
    }

    function onSettingsChanged(){
        Ui.requestUpdate();
    }

}

function getApp() as garmin_dead_pixel_widgetApp {
    return Application.getApp() as garmin_dead_pixel_widgetApp;
}