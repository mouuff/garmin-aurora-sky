import Toybox.Graphics;
import Toybox.WatchUi;

class aurora_skyView extends WatchUi.View {
    hidden var _bitmap;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        var cx = dc.getWidth() / 2;
        var cy = dc.getHeight() / 2;

        if (_bitmap != null) {
            cx -= _bitmap.getWidth() / 2;
            cy -= _bitmap.getHeight() / 2;

            dc.drawBitmap(cx, cy, _bitmap);
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }


    function setImage(data) {
        _bitmap = data;
        WatchUi.requestUpdate();
    }
}
