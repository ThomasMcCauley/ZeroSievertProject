var _temp_local_var_2;
gml_Script_uiAddBoxType("UiScrollBoxCredits", gml_Script_uiClassScrollBoxCredits, false)
function uiClassScrollBoxCredits() constructor //gml_Script_uiClassScrollBoxCredits
{
    var _temp_local_var_2 = gml_Script___uiClassCommon()
    if @@CopyStatic@@(gml_Script___uiClassCommon)
    {
    }
    else
    {
        function anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_1979_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits(argument0) //gml_Script_anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_1979_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits
        {
            var _oldScrollX = scrollX
            var _oldScrollY = scrollY
            var _width = self.Get("width")
            var _height = self.Get("height")
            var _targetLeft = argument0.__localLeft
            var _targetTop = argument0.__localTop
            var _targetRight = argument0.__localRight
            var _targetBottom = argument0.__localBottom
            var __worldScale = 1
            var __localScale = 1
            if (_targetLeft < obj_node_target_is_enemy)
            {
                if (_targetRight < _width)
                    scrollX = _targetLeft / __worldScale
                else
                    scrollX = (_width / 2 - _targetLeft / 2) / __worldScale
            }
            else if (_targetRight > _width)
                scrollX = (_targetRight - _width) / __worldScale
            if (_targetTop < 0)
            {
                if (_targetBottom < _height)
                    scrollY = _targetTop / __worldScale
                else
                    scrollY = (_height / 2 - _targetTop / 2) / __worldScale
            }
            else if (_targetBottom > _height)
                scrollY = (_targetBottom - _height) / __worldScale
            scrollX = clamp(scrollX, scrollXMin, scrollXMax)
            scrollY = clamp(scrollY, scrollYMin, scrollYMax)
            if (_oldScrollX != scrollX || _oldScrollY != scrollY)
                self.__Step(__worldOffsetX, __worldOffsetY, (__worldScale / __localScale), false)
            self.__ScrollParentToSelf()
        }

        function anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_5064_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits() //gml_Script_anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_5064_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits
        {
            if __destroyed
                return;
            __destroyed = true
            if surface_exists(__surface)
                surface_free(__surface)
            self.Set("active", false)
            self.Set("visible", false)
            var _i = 0
            repeat array_length(__children)
            {
                __children[_i].__children[_i].__DestroyInner()
                _i++
            }
        }

        function anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_5531_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits() //gml_Script_anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_5531_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits
        {
            var _new = false
            if (!surface_exists(__surface))
                _new = true
            else if (surface_get_width(__surface) != (__localRight - __localLeft) || surface_get_height(__surface) != (__localBottom - __localTop))
            {
                surface_free(__surface)
                _new = true
            }
            if _new
                __surface = gml_Script___uiSurfaceCreate(self, (__localRight - __localLeft), (__localBottom - __localTop))
        }

        function anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_6120_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits(argument0, argument1, argument2) //gml_Script_anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_6120_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits
        {
            gml_Script___uiContextStackPush(self)
            if (argument2 && __animMode == 1)
            {
                __animTime++
                self.__CallbackGet((24 << 0)).self.__CallbackGet((24 << 0)).__Call(self, __animTime)
                if (__animTime >= buildInLength)
                    self.BuildFinish()
            }
            argument0 += animXOffset
            argument1 += animYOffset
            __worldOffsetX = argument0
            __worldOffsetY = argument1
            __worldLeft = argument0 + __localLeft
            __worldTop = argument1 + __localTop
            __worldRight = argument0 + __localRight
            __worldBottom = argument1 + __localBottom
            if (argument2 && __active)
                self.__CallbackGet((11 << 0)).self.__CallbackGet((11 << 0)).__Call(self)
            _i = 0
            repeat array_length(__children)
            {
                var _child = __children[_i]
                if _child.__destroyed
                    array_delete(__children, _i, 1)
                else
                {
                    (__worldLeft - scrollX).(__worldLeft - scrollX).__Step((__worldTop - scrollY), argument2, _child)
                    _i++
                }
            }
            gml_Script___uiContextStackPop()
        }

        function anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_7876_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits(argument0, argument1, argument2) //gml_Script_anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_7876_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits
        {
            if (__stateDragging && (!argument2))
                return;
            gml_Script___uiContextStackPush(self)
            argument0 += animXOffset
            argument1 += animYOffset
            if __stateDragging
            {
                argument0 = __dragOffsetX
                argument1 = __dragOffsetY
            }
            __drawOffsetX = argument0
            __drawOffsetY = argument1
            __drawLeft = argument0 + __localLeft
            __drawTop = argument1 + __localTop
            __drawRight = argument0 + __localRight
            __drawBottom = argument1 + __localBottom
            if _debugStruct.__showSkeleton
            {
                var _oldColor = draw_get_color()
                var _oldAlpha = draw_get_alpha()
                draw_set_color(c_white)
                draw_set_alpha(1)
                draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, true)
                draw_set_color(_oldColor)
                draw_set_alpha(_oldAlpha)
            }
            if __visible
                self.__CallbackGet((12 << 0)).self.__CallbackGet((12 << 0)).__Call(self)
            self.__EnsureSurface()
            surface_set_target(__surface)
            draw_clear_alpha(c_black, 0)
            _i = 0
            repeat array_length(__children)
            {
                _child = __children[_i]
                if _child.__destroyed
                    array_delete(__children, _i, 1)
                else
                {
                    (-scrollX).(-scrollX).__Draw((-scrollY), argument2, _child)
                    _i++
                }
            }
            if _debugStruct.__showNavigationGraph
            {
                _oldColor = draw_get_color()
                _i = 0
                repeat array_length(__children)
                {
                    with (__children[_i])
                    {
                        if gml_Script___uiNullableRefAlive(__navigationRight)
                        {
                            draw_set_color(c_red)
                            var _target = __uiNullableRefResolve(__navigationRight)
                            draw_arrow((0.5 * (__drawLeft + __drawRight)), (0.5 * (__drawTop + __drawBottom) - 4), (0.5 * (_target.__drawLeft + _target.__drawRight)), (0.5 * (_target.__drawTop + _target.__drawBottom) - 4), 10)
                        }
                        if gml_Script___uiNullableRefAlive(__navigationUp)
                        {
                            draw_set_color(c_lime)
                            _target = __uiNullableRefResolve(__navigationUp)
                            draw_arrow((0.5 * (__drawLeft + __drawRight) - 4), (0.5 * (__drawTop + __drawBottom)), (0.5 * (_target.__drawLeft + _target.__drawRight) - 4), (0.5 * (_target.__drawTop + _target.__drawBottom)), 10)
                        }
                        if gml_Script___uiNullableRefAlive(__navigationLeft)
                        {
                            draw_set_color(c_aqua)
                            _target = __uiNullableRefResolve(__navigationLeft)
                            draw_arrow((0.5 * (__drawLeft + __drawRight)), (0.5 * (__drawTop + __drawBottom) + 4), (0.5 * (_target.__drawLeft + _target.__drawRight)), (0.5 * (_target.__drawTop + _target.__drawBottom) + 4), 10)
                        }
                        if gml_Script___uiNullableRefAlive(__navigationDown)
                        {
                            draw_set_color(c_fuchsia)
                            _target = __uiNullableRefResolve(__navigationDown)
                            draw_arrow((0.5 * (__drawLeft + __drawRight) + 4), (0.5 * (__drawTop + __drawBottom)), (0.5 * (_target.__drawLeft + _target.__drawRight) + 4), (0.5 * (_target.__drawTop + _target.__drawBottom)), 10)
                        }
                    }
                    _i++
                }
                draw_set_color(_oldColor)
            }
            surface_reset_target()
            draw_surface(__surface, __drawLeft, __drawTop)
            gml_Script___uiContextStackPop()
        }

    }
    scrollX = obj_node_target_is_enemy
    scrollXMin = 0
    scrollXMax = 0
    scrollY = 0
    scrollYMin = 0
    scrollYMax = 0
    draggableX = false
    draggableY = false
    __captureClipChildren = true
    __surface = -1
    __scrollDragOffsetX = 0
    __scrollDragOffsetY = 0
    self.CallbackSetHoverStart(function() //gml_Script_anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_4289_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits
    {
        gml_Script_uiCallInherited()
    }
)
    self.CallbackSetButtonStart(function() //gml_Script_anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_4378_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits
    {
        gml_Script_uiCallInherited()
        if (draggableX || draggableY)
        {
            __scrollDragOffsetX = scrollX
            __scrollDragOffsetY = scrollY
        }
    }
)
    self.CallbackSetButton(function() //gml_Script_anon_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits_4621_uiClassScrollBoxCredits_gml_GlobalScript_uiClassScrollBoxCredits
    {
        gml_Script_uiCallInherited()
        if draggableX
            scrollX = clamp(((-((uiPointerGetX() - gml_Script_uiPointerGetStartX()))) + __scrollDragOffsetX), scrollXMin, scrollXMax)
        if draggableY
            scrollY = clamp(((-((uiPointerGetY() - gml_Script_uiPointerGetStartY()))) + __scrollDragOffsetY), scrollYMin, scrollYMax)
    }
)
}

