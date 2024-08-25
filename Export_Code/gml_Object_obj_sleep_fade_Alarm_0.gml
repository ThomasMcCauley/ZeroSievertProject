a = (-a)
var _minutes = minutes
time_increment_minutes(_minutes)
with (player_get_local())
{
    var k1 = 1
    var k2 = 1
    if (x < 340 && y > 846)
    {
        k1 = global.sk_k[(50 << 0)]
        k2 = global.sk_k[(51 << 0)]
    }
    fatigue += (_minutes * 0.27 * k1)
    wound -= (_minutes * 0.05 * k2)
    hp += (_minutes * 0.15)
    bleed = 0
    radiation_accumulata -= (_minutes * 0.01)
    energy -= (_minutes * 0.04)
    thirst -= (_minutes * 0.05)
}
