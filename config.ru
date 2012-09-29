# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../web_view/config/environment',  __FILE__)
run CheckList::WebView::Application
