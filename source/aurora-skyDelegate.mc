import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Communications;
import Toybox.Graphics;

class aurora_skyDelegate extends WatchUi.BehaviorDelegate {
    hidden var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
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
        
        Communications.makeImageRequest(url, parameters, options, method(:onImageResponse));
        return true;
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new aurora_skyMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onImageResponse(responseCode as $.Toybox.Lang.Number, data as Null or $.Toybox.Graphics.BitmapReference or $.Toybox.WatchUi.BitmapResource) as Void {
        if (responseCode == 200) {
            _view.setImage(data);
        }
        else {
            // _view.setString("Failed.");
        }
    }
}