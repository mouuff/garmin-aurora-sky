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
                Graphics.COLOR_WHITE,        // White for bright highlights
                Graphics.COLOR_LT_GRAY,      // Light gray for softer highlights
                Graphics.COLOR_DK_GRAY,      // Dark gray for shadows
                Graphics.COLOR_BLACK,        // Black for deep shadows
                Graphics.COLOR_GREEN,        // Bright green for vivid aurora
                Graphics.COLOR_DK_GREEN,     // Dark green for deeper aurora shades
                Graphics.COLOR_YELLOW,       // Yellow for some variation in the aurora
                Graphics.COLOR_RED,          // Bright red for intense aurora
                Graphics.COLOR_DK_RED,       // Dark red for deeper aurora shades
                Graphics.COLOR_ORANGE,       // Orange for transitional colors
                Graphics.COLOR_BLUE,         // Blue for background or sky
                Graphics.COLOR_DK_BLUE,      // Dark blue for night sky
                Graphics.COLOR_PURPLE,       // Purple for some aurora variations
                Graphics.COLOR_PINK          // Pink for softer aurora highlights
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