using Toybox.Graphics as Gfx;
using Toybox.Graphics;
using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.System as Sys;

class garmin_dead_pixel_widgetView extends Ui.View {
    hidden var timer;
    var Screen = 1;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        timer = new Timer.Timer();
    	timer.start(method(:timerCallback), (App.Properties.getValue("interval")*1000), true);
    }

    function timerCallback() as Void {
        if (App.Properties.getValue("screen_color") == 0) {
            ReloadTimer();
            Screen += 1;
            if (Screen > 5) {
                Screen = 1;
            }
        } else {
            Screen = App.Properties.getValue("screen_color");
        }
        Ui.requestUpdate();
    }

    // Update the view
    function onUpdate(dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        fillScreen(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
        timer.stop();
    }

    function fillScreen(dc){
        dc.setAntiAlias(true);
        if (Screen == 1) {
            dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        } else if (Screen == 2) {
            dc.setColor(Gfx.COLOR_DK_GREEN, Gfx.COLOR_BLACK);
        } else if (Screen == 3) {
            dc.setColor(Gfx.COLOR_DK_BLUE, Gfx.COLOR_BLACK);
        } else if (Screen == 4) {
            dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        } else if (Screen == 5) {
            dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        }
        
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
    }

    function ReloadTimer() {
        timer.stop();
        timer.start(method(:timerCallback), (App.Properties.getValue("interval")*1000), true);
    }

}
