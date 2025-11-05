function UpdateWeatherURL()
    local skin = SKIN

    local TempSymbol = skin:GetVariable("TempSymbol")
    local WindMeasurement = skin:GetVariable("WindMeasurement")
    local lat = skin:GetMeasure("MeasureLatitude"):GetStringValue()
    local lon = skin:GetMeasure("MeasureLongitude"):GetStringValue()

    -- defaults
    local tempUnit = "fahrenheit"
    local windUnit = "mph"

    -- determine temperature unit
    if TempSymbol == "C" or TempSymbol == "c" then
        tempUnit = "celsius"
    end

    -- determine wind unit
    if WindMeasurement == "kph" or WindMeasurement == "kmh" or WindMeasurement == "KPH" then
        windUnit = "kmh"
    else
        windUnit = "mph"
    end

    local url = string.format(
        "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&current_weather=true&temperature_unit=%s&windspeed_unit=%s&timezone=auto",
        lat, lon, tempUnit, windUnit
    )

    skin:Bang('!SetOption', 'MeasureWeather', 'URL', url)
    skin:Bang('!CommandMeasure', 'MeasureWeather', 'Update')
end
