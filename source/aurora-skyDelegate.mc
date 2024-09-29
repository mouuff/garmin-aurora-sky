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
        if (keyEvent.getKey() == KEY_UP) {
            var url = "https://fox.phys.uit.no/ASC/Latest_ASC01.png";
            makeImageRequest(url);
            return true;
        }
        else if (keyEvent.getKey() == KEY_DOWN) {
            var url = "https://fox.phys.uit.no/ASC/keogram_ASC01.png";
            makeImageRequest(url);
            return true;
        }
        else {
            return false;
        }
    }

    function onMenu() as Boolean {
        // WatchUi.pushView(new Rez.Menus.MainMenu(), new aurora_skyMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    function makeImageRequest(url) {
        var width = _view.getWidth();
        var height = _view.getHeight();
        var parameters = null;
        var options = {
            :palette => [
                Graphics.COLOR_WHITE, // set the palette to 16 colors
                Graphics.COLOR_LT_GRAY,
                Graphics.COLOR_DK_GRAY,
                Graphics.COLOR_BLACK,
                Graphics.COLOR_RED,
                Graphics.COLOR_DK_RED,
                Graphics.COLOR_ORANGE,
                Graphics.COLOR_YELLOW,
                Graphics.COLOR_GREEN,
                Graphics.COLOR_DK_GREEN,
                Graphics.COLOR_BLUE,
                Graphics.COLOR_DK_BLUE,
                Graphics.COLOR_PURPLE,
                Graphics.COLOR_PINK
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
            _view.setText("Network error: " + responseCode);
        }
    }
}