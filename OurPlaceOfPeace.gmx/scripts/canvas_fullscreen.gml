// Requires Global Game Setting > HTML5 > Graphics > Full Scaling Enabled.
browserw = browser_width
browserh = browser_height

view_hview[0] = browserh;
view_wview[0] = browserw;
view_wport[0] = browserh / 2;
view_hport[0] = browserw / 2;
view_xview[0] = ((-browserw)/2) + view_wport[0];
view_yview[0] = ((-browserh)/2) + view_hport[0];

window_set_size(browserw, browserh)

window_center()
