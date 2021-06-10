import 'package:flutter/material.dart';


class Commande{
  String nom;
  String prenom;
  String date;
  String nomcommande;
  int id;
  int quantite;
  String deliveryadress;
  String prix;
  String Etat;
  String imageUrl;
  String nomresto;


  Commande({
    this.date,
    this.nom,
    this.prenom,
    this.id,
    this.prix,
    this.deliveryadress,
    this.nomcommande,
    this.quantite,
    this.Etat,
    this.imageUrl,
    this.nomresto
});

}

