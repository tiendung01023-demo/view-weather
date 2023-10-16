class WeatherModel {
  final LocationModel? location;
  final CurrentModel? current;

  WeatherModel({
    this.location,
    this.current,
  });

  WeatherModel.fromJson(Map<String, dynamic> json)
    : location = (json['location'] as Map<String,dynamic>?) != null ? LocationModel.fromJson(json['location'] as Map<String,dynamic>) : null,
      current = (json['current'] as Map<String,dynamic>?) != null ? CurrentModel.fromJson(json['current'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'location' : location?.toJson(),
    'current' : current?.toJson()
  };
}

class LocationModel {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final double? localtimeEpoch;
  final String? localtime;

  LocationModel({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  LocationModel.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String?,
      region = json['region'] as String?,
      country = json['country'] as String?,
      lat = (json['lat'] as num?)?.toDouble(),
      lon = (json['lon'] as num?)?.toDouble(),
      tzId = json['tz_id'] as String?,
      localtimeEpoch = (json['localtime_epoch'] as num?)?.toDouble(),
      localtime = json['localtime'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'region' : region,
    'country' : country,
    'lat' : lat,
    'lon' : lon,
    'tz_id' : tzId,
    'localtime_epoch' : localtimeEpoch,
    'localtime' : localtime
  };
}

class CurrentModel {
  final double? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final double? isDay;
  final ConditionModel? condition;
  final double? windMph;
  final double? windKph;
  final double? windDegree;
  final String? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final double? humidity;
  final double? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? visKm;
  final double? visMiles;
  final double? uv;
  final double? gustMph;
  final double? gustKph;

  CurrentModel({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  CurrentModel.fromJson(Map<String, dynamic> json)
    : lastUpdatedEpoch = (json['last_updated_epoch'] as num?)?.toDouble(),
      lastUpdated = json['last_updated'] as String?,
      tempC = (json['temp_c'] as num?)?.toDouble(),
      tempF = (json['temp_f'] as num?)?.toDouble(),
      isDay = (json['is_day'] as num?)?.toDouble(),
      condition = (json['condition'] as Map<String,dynamic>?) != null ? ConditionModel.fromJson(json['condition'] as Map<String,dynamic>) : null,
      windMph = (json['wind_mph'] as num?)?.toDouble(),
      windKph = (json['wind_kph'] as num?)?.toDouble(),
      windDegree = (json['wind_degree'] as num?)?.toDouble(),
      windDir = json['wind_dir'] as String?,
      pressureMb = (json['pressure_mb'] as num?)?.toDouble(),
      pressureIn = (json['pressure_in'] as num?)?.toDouble(),
      precipMm = (json['precip_mm'] as num?)?.toDouble(),
      precipIn = (json['precip_in'] as num?)?.toDouble(),
      humidity = (json['humidity'] as num?)?.toDouble(),
      cloud = (json['cloud'] as num?)?.toDouble(),
      feelslikeC = (json['feelslike_c'] as num?)?.toDouble(),
      feelslikeF = (json['feelslike_f'] as num?)?.toDouble(),
      visKm = (json['vis_km'] as num?)?.toDouble(),
      visMiles = (json['vis_miles'] as num?)?.toDouble(),
      uv = (json['uv'] as num?)?.toDouble(),
      gustMph = (json['gust_mph'] as num?)?.toDouble(),
      gustKph = (json['gust_kph'] as num?)?.toDouble();

  Map<String, dynamic> toJson() => {
    'last_updated_epoch' : lastUpdatedEpoch,
    'last_updated' : lastUpdated,
    'temp_c' : tempC,
    'temp_f' : tempF,
    'is_day' : isDay,
    'condition' : condition?.toJson(),
    'wind_mph' : windMph,
    'wind_kph' : windKph,
    'wind_degree' : windDegree,
    'wind_dir' : windDir,
    'pressure_mb' : pressureMb,
    'pressure_in' : pressureIn,
    'precip_mm' : precipMm,
    'precip_in' : precipIn,
    'humidity' : humidity,
    'cloud' : cloud,
    'feelslike_c' : feelslikeC,
    'feelslike_f' : feelslikeF,
    'vis_km' : visKm,
    'vis_miles' : visMiles,
    'uv' : uv,
    'gust_mph' : gustMph,
    'gust_kph' : gustKph
  };
}

class ConditionModel {
  final String? text;
  final String? icon;
  final double? code;

  ConditionModel({
    this.text,
    this.icon,
    this.code,
  });

  ConditionModel.fromJson(Map<String, dynamic> json)
    : text = json['text'] as String?,
      icon = json['icon'] as String?,
      code = (json['code'] as num?)?.toDouble();

  Map<String, dynamic> toJson() => {
    'text' : text,
    'icon' : icon,
    'code' : code
  };
}