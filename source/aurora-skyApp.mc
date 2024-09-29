import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class aurora_skyApp extends Application.AppBase {
    hidden var _view;
    hidden var _delegate;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        _view = new aurora_skyView();
        _delegate = new aurora_skyDelegate(_view);

        _view.onShowCallback = method(:onInitialShow);
        return [ _view, _delegate ];
    }

    function onInitialShow() {
        _delegate.onPreviousPage();
    }
}

function getApp() as aurora_skyApp {
    return Application.getApp() as aurora_skyApp;
}