hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon

-- set up your windowfilter
switcher = hs.window.switcher.new(hs.window.filter.new())

-- bind to hotkeys; WARNING: at least one modifier key is required!
hs.hotkey.bind('alt','tab','Next window',function()switcher:next()end)
hs.hotkey.bind('alt-shift','tab','Prev window',function()switcher:previous()end)
