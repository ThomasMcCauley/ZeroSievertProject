function scr_ga_setup() //gml_Script_scr_ga_setup
{
    db_open("shared settings")
    var _active = db_read("Game analytics", "collect_data", false)
    db_close()
    if (_active == true)
    {
        ga_setEnabledInfoLog(true)
        ga_setEnabledVerboseLog(true)
        ga_configureBuild("0.29.03")
        var array = ga_array("gems", "gold")
        ga_configureAvailableResourceCurrencies(array)
        array = ga_array("gems", "gold")
        ga_configureAvailableResourceItemTypes(array)
        array = ga_array("ninja", "samurai")
        ga_configureAvailableCustomDimensions01(array)
        array = ga_array("whale", "dolphin")
        ga_configureAvailableCustomDimensions02(array)
        array = ga_array("horde", "alliance")
        ga_configureAvailableCustomDimensions03(array)
        ga_initialize("c60d53b2e8826570647731f7a054d0c4", "64f6498e33fb45f53caae7bd41e8e25850b52a24")
    }
}

