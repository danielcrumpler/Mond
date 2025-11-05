function Initialize()
end

function Update()
  local code = tonumber(SKIN:GetMeasure('MeasureWeatherCode'):GetStringValue()) or 0
  local isDay = tonumber(SKIN:GetMeasure('MeasureIsDay'):GetStringValue()) or 1
  local icons = {
    [0]={'clear_day.png','clear_night.png'},
    [1]={'fair_day.png','fair_night.png'},
    [2]={'partly_cloudy_day.png','partly_cloudy_night.png'},
    [3]={'cloudy_day_night.png','cloudy_day_night.png'},
    [45]={'fog_day_night.png','fog_day_night.png'},
    [48]={'fog_day_night.png','fog_day_night.png'},
    [51]={'rain_day_night.png','rain_day_night.png'},
    [61]={'rain_day_night.png','rain_day_night.png'},
    [66]={'freezing_rain_day_night.png','freezing_rain_day_night.png'},
    [71]={'snow_day_night.png','snow_day_night.png'},
    [80]={'scattered_showers_day_night.png','scattered_showers_day_night.png'},
    [95]={'thundershowers_day_night.png','thundershowers_day_night.png'}
  }
  local icon = icons[code] and icons[code][isDay==1 and 1 or 2] or 'cloudy_day_night.png'
  return icon
end
