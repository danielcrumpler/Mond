function Initialize()
    SetWeatherIcon("cloudy_day_night.png")
end

function Update()
    local codeMeasure = SKIN:GetMeasure("MeasureWeatherCode")
    local dayMeasure = SKIN:GetMeasure("MeasureIsDay")

    local code = tonumber(codeMeasure:GetStringValue()) or -1
    local isDay = tonumber(dayMeasure:GetStringValue()) or 1

    local icons = {
        [0]  = {"clear_day.png", "clear_night.png"},
        [1]  = {"fair_day.png", "fair_night.png"},
        [2]  = {"partly_cloudy_day.png", "partly_cloudy_night.png"},
        [3]  = {"cloudy_day_night.png", "cloudy_day_night.png"},

        [45] = {"fog_day_night.png", "fog_day_night.png"},
        [48] = {"fog_day_night.png", "fog_day_night.png"},

        [51] = {"rain_day_night.png", "rain_day_night.png"},
        [53] = {"rain_day_night.png", "rain_day_night.png"},
        [55] = {"rain_day_night.png", "rain_day_night.png"},
        [56] = {"freezing_rain_day_night.png", "freezing_rain_day_night.png"},
        [57] = {"freezing_rain_day_night.png", "freezing_rain_day_night.png"},

        [61] = {"rain_day_night.png", "rain_day_night.png"},
        [63] = {"rain_day_night.png", "rain_day_night.png"},
        [65] = {"rain_day_night.png", "rain_day_night.png"},
        [66] = {"freezing_rain_day_night.png", "freezing_rain_day_night.png"},
        [67] = {"freezing_rain_day_night.png", "freezing_rain_day_night.png"},

        [71] = {"snow_day_night.png", "snow_day_night.png"},
        [73] = {"snow_day_night.png", "snow_day_night.png"},
        [75] = {"snow_day_night.png", "snow_day_night.png"},
        [77] = {"snow_day_night.png", "snow_day_night.png"},

        [80] = {"scattered_showers_day_night.png", "scattered_showers_day_night.png"},
        [81] = {"scattered_showers_day_night.png", "scattered_showers_day_night.png"},
        [82] = {"scattered_showers_day_night.png", "scattered_showers_day_night.png"},

        [85] = {"snow_day_night.png", "snow_day_night.png"},
        [86] = {"snow_day_night.png", "snow_day_night.png"},

        [95] = {"thundershowers_day_night.png", "thundershowers_day_night.png"},
        [96] = {"thundershowers_day_night.png", "thundershowers_day_night.png"},
        [99] = {"thundershowers_day_night.png", "thundershowers_day_night.png"}
    }

    local pair = icons[code]
    local icon = "cloudy_day_night.png"

    if pair then
        icon = pair[isDay == 1 and 1 or 2]
    end

    SetWeatherIcon(icon)

    return 0
end

function SetWeatherIcon(icon)
    SKIN:Bang("!SetOption", "MeterCurrentIcon", "ImageName", icon)
    SKIN:Bang("!UpdateMeter", "MeterCurrentIcon")
    SKIN:Bang("!Redraw")
end