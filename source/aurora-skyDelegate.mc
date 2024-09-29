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

    function onNextPage() {
        var url = "https://fox.phys.uit.no/ASC/keogram_ASC01.png";
        makeImageRequest(url);
        return true;
    }

    function onPreviousPage() {
        var url = "https://fox.phys.uit.no/ASC/Latest_ASC01.png";
        makeImageRequest(url);
        return true;
    }

    function onMenu() as Boolean {
        // WatchUi.pushView(new Rez.Menus.MainMenu(), new aurora_skyMenuDelegate(), WatchUi.SLIDE_UP);
        return false;
    }
    
    function makeImageRequest(url) {
        var width = _view.getWidth() * 1.15;
        var height = _view.getHeight() * 1.15;
        var parameters = null;
        var options = {
            :palette => [
                0xFFFFFF, // White
                0xD3D3D3, // Light Gray
                0xA9A9A9, // Dark Gray
                0x000000, // Black
                0x00FF00, // Bright Green
                0x00CC00, // Medium Green
                0x009900, // Dark Green
                0x006600, // Very Dark Green
                0xFFFF00, // Yellow
                0xFFCC00, // Orange-Yellow
                0xFF9900, // Orange
                0xFF0000, // Bright Red
                0xCC0000, // Medium Red
                0x990000, // Dark Red
                0x00AAFF, // Bright Blue
                0x800080  // Purple
            ],
            :maxWidth => width,
            :maxHeight => height,
            :dithering => Communications.IMAGE_DITHERING_FLOYD_STEINBERG
        };
        
        _view.setText("Loading...");
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