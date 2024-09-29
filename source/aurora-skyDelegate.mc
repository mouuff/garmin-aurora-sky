import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Communications;
import Toybox.Graphics;

class aurora_skyDelegate extends WatchUi.BehaviorDelegate {
    public var toggleResponseCallback as Lang.Method?;

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent) {
        var url = "https://fox.phys.uit.no/ASC/Latest_ASC01.png";
        var parameters = null;
        var options = {
            :palette => [ Graphics.COLOR_ORANGE,
                          Graphics.COLOR_DK_BLUE,
                          Graphics.COLOR_BLUE,
                          Graphics.COLOR_BLACK ],
            :maxWidth => 100,
            :maxHeight => 100,
            :dithering => Communications.IMAGE_DITHERING_NONE 
        };
        
        Communications.makeImageRequest(url, parameters, options, toggleResponseCallback);
        return true;
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new aurora_skyMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function responseCallback(responseCode, data) {
        if (responseCode != 200) {
            // _view.setBitmap(data);
        }
        else {
            // _view.setString("Failed.");
        }
    }
}