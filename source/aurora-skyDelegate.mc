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
        makeImageRequest(url);
        return true;
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new aurora_skyMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function makeImageRequest(url) {
        var width = _view.width;
        var height = _view.height;
        var parameters = null;
        var options = {
            :palette => [
                Graphics.COLOR_WHITE,
                Graphics.COLOR_GREEN,
                Graphics.COLOR_DK_GREEN,
                Graphics.COLOR_LT_GRAY,
                Graphics.COLOR_DK_GRAY,
                Graphics.COLOR_BLACK
            ],
            :maxWidth => width,
            :maxHeight => height,
            :dithering => Communications.IMAGE_DITHERING_NONE
        };
        
        Communications.makeImageRequest(url, parameters, options, method(:onImageResponse));
    }

    function onImageResponse(
            responseCode as $.Toybox.Lang.Number,
            data as Null or $.Toybox.Graphics.BitmapReference or $.Toybox.WatchUi.BitmapResource) as Void {
        if (responseCode == 200) {
            _view.setImage(data);
        }
        else {
            // _view.setString("Failed.");
        }
    }
}