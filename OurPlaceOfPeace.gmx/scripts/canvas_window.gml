// Requires Global Game Setting > HTML5 > Graphics > Full Scaling Enabled.
browserw = browser_width
browserh = browser_height
browserMinSize = min(browserw, browserh);

view_hview[0] = browserMinSize;
view_wview[0] = browserMinSize;
view_wport[0] = browserMinSize / 2;
view_hport[0] = browserMinSize / 2;
view_xview[0] = ((-browserMinSize)/2) + view_wport[0];
view_yview[0] = ((-browserMinSize)/2) + view_hport[0];

window_set_size(browserMinSize, browserMinSize)

window_center()
