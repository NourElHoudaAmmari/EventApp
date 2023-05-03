class Inscription {
  late final String? id;
  late final String? nom;
  late final String? prenom;
  late final String? mail;
  late final String? adresse;
  late final int? numtel;
   late final String? updated;


  Inscription( {
      this.nom,
       this.id, this.updated
       , this.prenom,  this.mail, this.adresse, 
        this.numtel});

   Inscription.fromJson(Map<String, dynamic> json) {
       id=json['id'] ;
      nom= json['nom'];
      prenom =  json['prenom'];
      numtel = json['numtel'];
      mail = json['mail'] ;
      adresse = json['adresse'];
       updated= json['updated'];
  }

  Map<String, dynamic> toJson() {
      final _data = <String, dynamic>{};
       _data["id"]=id;
     _data["nom"] =  nom;
     _data["prenom"] = prenom;
     _data["numtel"] = numtel;
     _data["mail"] = mail;
      _data["adresse"] = adresse ;
      _data["updated"]= updated;
        return _data;
    
      }
        @override
  String toString() {
    return 'Inscription{id: $id, nom: $nom,  prenom: $prenom,  numtel: $numtel, mail: $mail, adresse: $adresse,  }';
  }
}
