class PlaceModel {
  final int? placeId;
  final String? licence;
  final String? osmType;
  final int? osmId;
  final String? lat;
  final String? lon;
  final String? type;
  final int? placeRank;
  final double? importance;
  final String? addresstype;
  final String? name;
  final String? displayName;
  final List<String>? boundingbox;

  PlaceModel({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.type,
    this.placeRank,
    this.importance,
    this.addresstype,
    this.name,
    this.displayName,
    this.boundingbox,
  });

  PlaceModel.fromJson(Map<String, dynamic> json)
    : placeId = json['place_id'] as int?,
      licence = json['licence'] as String?,
      osmType = json['osm_type'] as String?,
      osmId = json['osm_id'] as int?,
      lat = json['lat'] as String?,
      lon = json['lon'] as String?,
      type = json['type'] as String?,
      placeRank = json['place_rank'] as int?,
      importance = json['importance'] as double?,
      addresstype = json['addresstype'] as String?,
      name = json['name'] as String?,
      displayName = json['display_name'] as String?,
      boundingbox = (json['boundingbox'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'place_id' : placeId,
    'licence' : licence,
    'osm_type' : osmType,
    'osm_id' : osmId,
    'lat' : lat,
    'lon' : lon,
    'type' : type,
    'place_rank' : placeRank,
    'importance' : importance,
    'addresstype' : addresstype,
    'name' : name,
    'display_name' : displayName,
    'boundingbox' : boundingbox
  };
}