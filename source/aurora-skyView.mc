
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

class aurora_skyView extends WatchUi.View {
    public var onShowCallback as Lang.Method?;

    hidden var _bitmap;
    hidden var _text;
    
    hidden var _width;
    hidden var _height;

    function initialize() {
        View.initialize();
        _text = "Loadi.";
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
        _width = dc.getWidth();
        _height = dc.getHeight();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        self.onShowCallback.invoke();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        var cx = getWidth() / 2;
        var cy = getHeight() / 2;

        if (_bitmap != null) {
            cx -= _bitmap.getWidth() / 2;
            cy -= _bitmap.getHeight() / 2;

            dc.drawBitmap(cx, cy, _bitmap);
        } else {
            dc.drawText(cx, cy, Graphics.FONT_SMALL, _text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function setImage(data) {
        _bitmap = data;
        _text = null;
        WatchUi.requestUpdate();
    }

    function setText(text) {
        _bitmap = null;
        _text = text;
        WatchUi.requestUpdate();
    }

    function getWidth() {
        return _width;
    }

    function getHeight() {
        return _height;
    }
}
