class Events {
  late final String? id;
   late final String? name;
  late final String? description;
 late final String? location;
  late final String? imageUrl;
 late  final String? date;
 late final String? duree;
 late  final String? nbplace;
 late final String? updated;

  Events(
     {
    this.id,
    this.name,
    this.description,
     this.location,
     this.nbplace,
    this.imageUrl,
   this.date,
    this.duree,
    this.updated,
  });

 Events.fromJson(Map<String, dynamic> json) {
    
      id=json['id'] ;
      name = json['name'];
   description = json['description'] ;
      location =  json['location'] ;
      imageUrl =  json['imageUrl'] ;
      date = json['date'] ;
      duree =json['duree'] ;
      nbplace= json['nbplace'];
      updated= json['updated'];
    
  }
     Map<String, dynamic> toJson(){
    final _data = <String, dynamic>{};
    _data["id"]=id;
    _data["name"]=name;
    _data["description"]=description;
    _data["location"]=location;
     _data["imageUrl"]=imageUrl;
      _data["date"]=date;
        _data["duree"]=duree;
          _data["nbplace"]=nbplace;
             _data["updated"]=updated;

    return _data;

   }

  @override
  String toString() {
    return 'Event{id: $id, name: $name, location: $location}';
  }
}