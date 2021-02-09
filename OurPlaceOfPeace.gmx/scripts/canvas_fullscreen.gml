browserw = browser_width;
browserh = browser_height;

halfViewWidth = min(320, browserw/2);
halfViewHeight = min(240, browserh/2);

view_hview[0] = browserh;
view_wview[0] = browserw;
view_xview[0] = ((-browserw)/2) + halfViewWidth;
view_yview[0] = ((-browserh)/2) + halfViewHeight;

window_set_size(browserw, browserh)

window_center();
