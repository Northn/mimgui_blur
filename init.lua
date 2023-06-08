local ffi = require 'ffi'
local mimgui = require 'mimgui'

local mimgui_blur = {}

local libPath = getWorkingDirectory() .. [[\lib\mimgui_blur\mimgui_blur_lib]]

ffi.cdef[[
    void mimgui_blur_apply(ImDrawList *draw_list, const int radius, const ImU32 color, const float rounding, const ImDrawCornerFlags rounding_corners, const ImVec2 pos_min, const ImVec2 pos_max);
    void mimgui_blur_invalidate();
    int mimgui_blur_version();
]]

local lib = ffi.load(libPath)

function mimgui_blur.apply(draw_list, radius, color, rounding, rounding_corners)
    radius = radius or 2
    color = color or -1
    rounding = rounding or 0
    rounding_corners = rounding_corners or 0
    lib.mimgui_blur_apply(draw_list, radius, color, rounding, rounding_corners, mimgui.ImVec2(0, 0), mimgui.ImVec2(math.huge, math.huge))
end

function mimgui_blur.applyItem(draw_list, radius, color, rounding, rounding_corners)
    radius = radius or 2
    color = color or -1
    rounding = rounding or 0
    rounding_corners = rounding_corners or 0
    lib.mimgui_blur_apply(draw_list, radius, color, rounding, rounding_corners, mimgui.GetItemRectMin(), mimgui.GetItemRectMax()) 
end

function mimgui_blur.applyRect(draw_list, radius, pos_start, pos_end, color, rounding, rounding_corners)
    radius = radius or 2
    color = color or -1
    rounding = rounding or 0
    rounding_corners = rounding_corners or 0
    lib.mimgui_blur_apply(draw_list, radius, color, rounding, rounding_corners, pos_start, pos_end) 
end

addEventHandler('onD3DDeviceLost', function()
    lib.mimgui_blur_invalidate()
end)

addEventHandler('onScriptTerminate', function(scr)
    if scr == script.this then
        lib.mimgui_blur_invalidate()
    end
end)

mimgui_blur.VERSION = lib.mimgui_blur_version()

return mimgui_blur
