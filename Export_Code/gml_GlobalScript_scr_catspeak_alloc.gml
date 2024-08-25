function catspeak_collect() //gml_Script_catspeak_collect
{
    var pool = global.__catspeakAllocPool
    var poolSize = array_length(pool)
    for (var i = 0; i < poolSize; i += 1)
    {
        var weakRef = pool[i]
        if weak_ref_alive(weakRef)
        {
        }
        else
        {
            weakRef.ds.weakRef.ds.destroy(weakRef.adapter)
            array_delete(pool, i, 1)
        }
    }
}

function __catspeak_alloc(argument0, argument1) //gml_Script___catspeak_alloc
{
    pool = global.__catspeakAllocPool
    var poolMax = array_length(pool) - 1
    if (poolMax >= 0)
    {
        repeat (3)
        {
            i = irandom(poolMax)
            weakRef = pool[i]
            if weak_ref_alive(weakRef)
            {
            }
            else
            {
                weakRef.ds.weakRef.ds.destroy(weakRef.adapter)
                var newWeakRef = weak_ref_create(argument0)
                var resource = argument1.argument1.create()
                newWeakRef.adapter = argument1
                newWeakRef.ds = resource
                pool[i] = newWeakRef
                return resource;
            }
        }
    }
    weakRef = weak_ref_create(argument0)
    resource = argument1.argument1.create()
    weakRef.adapter = argument1
    weakRef.ds = resource
    array_push(pool, weakRef)
    return resource;
}

function __catspeak_alloc_ds_map(argument0) //gml_Script___catspeak_alloc_ds_map
{
    return __catspeak_alloc(argument0, global.__catspeakAllocDSMapAdapter);
}

function __catspeak_alloc_ds_list(argument0) //gml_Script___catspeak_alloc_ds_list
{
    return __catspeak_alloc(argument0, global.__catspeakAllocDSListAdapter);
}

function __catspeak_alloc_ds_stack(argument0) //gml_Script___catspeak_alloc_ds_stack
{
    return __catspeak_alloc(argument0, global.__catspeakAllocDSStackAdapter);
}

function __catspeak_alloc_ds_priority(argument0) //gml_Script___catspeak_alloc_ds_priority
{
    return __catspeak_alloc(argument0, global.__catspeakAllocDSPriorityAdapter);
}

function __catspeak_init_alloc() //gml_Script___catspeak_init_alloc
{
    global.__catspeakAllocPool = []
    global.__catspeakAllocDSMapAdapter = 
    {
        create: ds_map_create,
        destroy: ds_map_destroy
    }

    global.__catspeakAllocDSListAdapter = 
    {
        create: ds_list_create,
        destroy: ds_list_destroy
    }

    global.__catspeakAllocDSStackAdapter = 
    {
        create: ds_stack_create,
        destroy: ds_stack_destroy
    }

    global.__catspeakAllocDSPriorityAdapter = 
    {
        create: ds_priority_create,
        destroy: ds_priority_destroy
    }

}

