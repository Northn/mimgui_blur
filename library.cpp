// MIT License

// Copyright (c) 2023 Northn

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#include "cimgui/imgui/imgui.h"
#include "imgui_blur.hpp"

extern "C" {
__declspec(dllexport) void mimgui_blur_apply(ImDrawList *draw_list,
                                             const float radius,
                                             const ImU32 color,
                                             const float rounding,
                                             const ImDrawCornerFlags rounding_corners,
                                             const ImVec2 pos_min,
                                             const ImVec2 pos_max) {
  imgui_blur::apply(draw_list, radius, color, rounding, rounding_corners, pos_min, pos_max);
}

__declspec(dllexport) void mimgui_blur_invalidate() {
  imgui_blur::invalidate();
}

__declspec(dllexport) float mimgui_blur_version() {
  return MIMGUI_BLUR_VERSION;
}
}
