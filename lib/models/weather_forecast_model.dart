class WeatherForecastModel {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentWeather? currentWeather;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  WeatherForecastModel(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.currentWeather,
      this.hourlyUnits,
      this.hourly,
      this.dailyUnits,
      this.daily});

  WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'].toDouble();
    longitude = json['longitude'].toDouble();
    generationtimeMs = json['generationtime_ms'].toDouble();
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'].toDouble();
    currentWeather = json['current_weather'] != null
        ? CurrentWeather.fromJson(json['current_weather'])
        : null;
    hourlyUnits = json['hourly_units'] != null
        ? HourlyUnits.fromJson(json['hourly_units'])
        : null;
    hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
    dailyUnits = json['daily_units'] != null
        ? DailyUnits.fromJson(json['daily_units'])
        : null;
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['generationtime_ms'] = this.generationtimeMs;
    data['utc_offset_seconds'] = this.utcOffsetSeconds;
    data['timezone'] = this.timezone;
    data['timezone_abbreviation'] = this.timezoneAbbreviation;
    data['elevation'] = this.elevation;
    if (this.currentWeather != null) {
      data['current_weather'] = this.currentWeather!.toJson();
    }
    if (this.hourlyUnits != null) {
      data['hourly_units'] = this.hourlyUnits!.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly!.toJson();
    }
    if (this.dailyUnits != null) {
      data['daily_units'] = this.dailyUnits!.toJson();
    }
    if (this.daily != null) {
      data['daily'] = this.daily!.toJson();
    }
    return data;
  }
}

class CurrentWeather {
  double? temperature;
  double? windspeed;
  int? winddirection;
  int? weathercode;
  int? isDay;
  String? time;

  CurrentWeather(
      {this.temperature,
      this.windspeed,
      this.winddirection,
      this.weathercode,
      this.isDay,
      this.time});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'].toDouble();
    windspeed = json['windspeed'].toDouble();
    winddirection = json['winddirection'];
    weathercode = json['weathercode'];
    isDay = json['is_day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['windspeed'] = this.windspeed;
    data['winddirection'] = this.winddirection;
    data['weathercode'] = this.weathercode;
    data['is_day'] = this.isDay;
    data['time'] = this.time;
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;

  HourlyUnits({this.time, this.temperature2m});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;

  Hourly({this.time, this.temperature2m});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    return data;
  }
}

class DailyUnits {
  String? time;
  String? weathercode;
  String? temperature2mMax;
  String? temperature2mMin;
  String? sunrise;
  String? sunset;

  DailyUnits(
      {this.time,
      this.weathercode,
      this.temperature2mMax,
      this.temperature2mMin,
      this.sunrise,
      this.sunset});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    weathercode = json['weathercode'];
    temperature2mMax = json['temperature_2m_max'];
    temperature2mMin = json['temperature_2m_min'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['weathercode'] = this.weathercode;
    data['temperature_2m_max'] = this.temperature2mMax;
    data['temperature_2m_min'] = this.temperature2mMin;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}

class Daily {
  List<String>? time;
  List<int>? weathercode;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;
  List<String>? sunrise;
  List<String>? sunset;

  Daily(
      {this.time,
      this.weathercode,
      this.temperature2mMax,
      this.temperature2mMin,
      this.sunrise,
      this.sunset});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    weathercode = json['weathercode'].cast<int>();
    temperature2mMax = json['temperature_2m_max'].cast<double>();
    temperature2mMin = json['temperature_2m_min'].cast<double>();
    sunrise = json['sunrise'].cast<String>();
    sunset = json['sunset'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['weathercode'] = this.weathercode;
    data['temperature_2m_max'] = this.temperature2mMax;
    data['temperature_2m_min'] = this.temperature2mMin;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}
