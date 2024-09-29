import Toybox.Lang;
import Toybox.WatchUi;
using Toybox.Communications as Comm;
using Toybox.Graphics as Gfx;

class aurora_skyDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent) {
        var url = "https://fox.phys.uit.no/ASC/Latest_ASC01.png";
        var params = {};
        var options = {
            :palette => [
                Gfx.COLOR_WHITE,
                Gfx.COLOR_GREEN,
                Gfx.COLOR_DK_GREEN,
                Gfx.COLOR_LT_GRAY,
                Gfx.COLOR_DK_GRAY,
                Gfx.COLOR_BLACK
            ],
            :maxWidth => 127,
            :maxHeight => 127,
            :dithering => Comm.IMAGE_DITHERING_NONE
        };
        
        Comm.makeImageRequest(url, params, options, self.method(:onImageResponse));
        return true;
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new aurora_skyMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onImageResponse(code, bitmap) {
        if (code != 200) {
            // _view.setBitmap(bitmap);
        }
        else {
            // _view.setString("Failed.");
        }
    }
}