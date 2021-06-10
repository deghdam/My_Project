import 'package:flutter/material.dart';




class Restaurent{
  int id;
String imageUrl;
String name;
String location;
String Horaire;
String raiting;
  String email;
  int phone;

Restaurent({
  this.imageUrl,
  this.name,
  this.location,
  this.Horaire,
  this.raiting,
  this.email,
  this.id,
  this.phone,
});

}

List<Restaurent> restaurents = [
  Restaurent(
    imageUrl: 'assets/restaurent/idel_resto.jpg',
    name: 'Idel',
    location: 'Nouvelle ville Constantine',
    Horaire: 'Tous les jours entre 10h au 22h00',
    raiting: 'Note : 4 ⭐ '
  ),
  Restaurent(
    imageUrl: 'assets/restaurent/galerie_resto.jpg',
    name: 'Galerie',
    location: 'Sidi Mabrouk Constantine',
      Horaire: 'Tous les jours entre 10h au 15h00',
      raiting: 'Note :  4.5 ⭐'
  ),
  Restaurent(
    imageUrl: 'assets/restaurent/BeefUSA.jpg',
    name: ' Beef USA',
    location: 'Bousouf Constantine',
      Horaire: 'Tous les jours entre 10h au 21h30',
      raiting: 'Note : 5 ⭐ '
  ),
  Restaurent(
    imageUrl: 'assets/restaurent/arty_resto.jpg',
    name: 'Arty',
    location: 'Ain Smara Constantine',
      Horaire: 'Tous les jours entre 10h au 23h00',
      raiting: 'Note 3⭐'
  ),
];