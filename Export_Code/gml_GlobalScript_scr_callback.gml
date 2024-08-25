global.Callback_Data = []
function callback(argument0, argument1, argument2, argument3, argument4) //gml_Script_callback
{
    if (argument3 == undefined)
        argument3 = false
    if (argument4 == undefined)
        argument4 = []
    var _struct = {}
    with (_struct)
    {
        for (var i = 0; i < array_length(argument4); i++)
            variable_struct_set(self, array_get(array_get(argument4, i), 0), argument4[i][1])
        if argument3
        {
            if (argument0 != undefined)
                self.method(self, argument0)()
        }
        else if (argument0 != undefined)
        {
            start = method(self, argument0)
            started = false
        }
        step = method(self, argument1)
        if (argument2 != undefined)
            complete = argument2
        else
            complete = undefined
        async_allowed = argument3
        array_push(global.Callback_Data, self)
    }
}

function callback_process() //gml_Script_callback_process
{
    for (i = 0; i < array_length(global.Callback_Data); i++)
    {
        with (global.Callback_Data[i])
        {
            if async_allowed
            {
                if self.self.step()
                {
                    if (complete != undefined)
                        self.self.complete(self)
                    array_delete(global.Callback_Data, i, 1)
                    i--
                }
            }
            else
            {
                if started
                {
                    if self.self.step()
                    {
                        if (complete != undefined)
                            self.self.complete(self)
                        array_delete(global.Callback_Data, i, 1)
                    }
                }
                else
                {
                    if (start != undefined)
                        self.self.start()
                    started = true
                }
                return;
            }
        }
    }
}

