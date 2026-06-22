function UpdateWeatherURL()
    local skin = SKIN

    local modeText = skin:GetVariable("UseManualLocation", "0")
    local useManual = tonumber(modeText) or 0

    local lat
    local lon
    local source

    if useManual == 1 then
        source = "manual"

        lat = tonumber(
            skin:GetVariable("ManualLatitude", "")
        )

        lon = tonumber(
            skin:GetVariable("ManualLongitude", "")
        )
    else
        source = "automatic"

        local latitudeMeasure =
            skin:GetMeasure("MeasureLatitudeAuto")

        local longitudeMeasure =
            skin:GetMeasure("MeasureLongitudeAuto")

        if not latitudeMeasure or not longitudeMeasure then
            skin:Bang(
                "!Log",
                "Automatic location measures do not exist.",
                "Error"
            )
            return
        end

        lat = tonumber(latitudeMeasure:GetStringValue())
        lon = tonumber(longitudeMeasure:GetStringValue())
    end

    skin:Bang(
        "!Log",
        "Location mode: " .. source ..
        " (UseManualLocation=" .. modeText .. ")",
        "Notice"
    )

    if lat == nil or lon == nil then
        skin:Bang(
            "!Log",
            source .. " weather location is not ready yet.",
            "Notice"
        )
        return
    end

    local tempSymbol =
        string.lower(skin:GetVariable("TempSymbol", "f"))

    local windMeasurement =
        string.lower(skin:GetVariable("WindMeasurement", "mph"))

    local tempUnit = "fahrenheit"
    local windUnit = "mph"

    if tempSymbol == "c" then
        tempUnit = "celsius"
    end

    if windMeasurement == "kph"
        or windMeasurement == "kmh"
        or windMeasurement == "km/h" then
        windUnit = "kmh"
    end

    local url = string.format(
        "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&current_weather=true&temperature_unit=%s&windspeed_unit=%s&timezone=auto",
        tostring(lat),
        tostring(lon),
        tempUnit,
        windUnit
    )

    skin:Bang(
        "!Log",
        "URL: " .. url ..
        "Notice"
    )

    skin:Bang(
        "!SetOption",
        "MeasureWeather",
        "URL",
        url
    )

    skin:Bang(
        "!UpdateMeasure",
        "MeasureWeather"
    )

    skin:Bang(
        "!CommandMeasure",
        "MeasureWeather",
        "Update"
    )

    skin:Bang(
        "!Log",
        "Weather URL updated using " .. source ..
        " location: " .. tostring(lat) ..
        ", " .. tostring(lon),
        "Notice"
    )
end