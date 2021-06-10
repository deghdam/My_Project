import 'dart:ffi';

import 'package:flutter/material.dart';


class Categorie{
  String id;
  String imageUrl;
  String type;
  String name;
  String prix;
  String nresto;
  String raiting;
  String ingredien;







Categorie({
  this.id,
  this.imageUrl,
  this.type,
  this.name,
  this.prix,
  this.nresto,
  this.raiting,
  this.ingredien,
});
}


List<Categorie> categories = [
  Categorie(
 imageUrl: "assets/categorie/pizza.jpg",
 type: 'Pizza',
),
  Categorie(
imageUrl: 'assets/categorie/soupe.jpg',
type: 'Soupe',
),
  Categorie(
imageUrl: 'assets/categorie/sandwich.jpg',
type: 'Sandwich',
      nresto: 'BEF USA' ,
      raiting:  '⭐⭐⭐⭐⭐'
),
  Categorie(
    imageUrl: 'assets/categorie/Salade.jpg',
    type: 'Salade',
  ),
];

List<Categorie> Pizza = [
  Categorie(
    imageUrl: 'assets/categorie/pizza.jpg',
    name: 'Pizza Végitarienne',
    prix: '350 DA',
    nresto: 'Idel' ,
    raiting:  '⭐⭐⭐⭐',
    ingredien: '1 pâte à pizza prête à dérouler , 150 g de dés (ou de lamelles) de jambon',

  ),
  Categorie(
    imageUrl: 'assets/categorie/pizza/pizza1.jpg',
    name: 'Pizza 4 Fromages',
    prix: '450 DA',
      nresto: 'Galerie' ,
      raiting:  '⭐⭐⭐⭐⭐',
    ingredien: '1 pâte à pizza prête à dérouler , Fromage',
  ),
  Categorie(
    imageUrl: 'assets/categorie/pizza/pizza2.jpg',
    name: ' Pizza Napolitane',
    prix: '400 DA',
      nresto: 'BEF USA' ,
      raiting:  '⭐⭐⭐',
    ingredien: '1 pâte à pizza prête à dérouler , Fromage',
  ),
  Categorie(
    imageUrl: 'assets/categorie/pizza/pizza3.jpg',
    name: 'Pizza 4 Saisson',
    prix: '350 DA',
      nresto: 'Arty' ,
      raiting:  '⭐⭐⭐',
    ingredien: '1 pâte à pizza prête à dérouler , Fromage',
  ),
];

List<Categorie> Soupe = [
  Categorie(
    imageUrl: 'assets/categorie/Soupe/Soupe1.jpg',
    name: 'Soupe Légume',
    prix: '350 DA',
      nresto: 'Idel' ,
      raiting:  '⭐⭐⭐',
    ingredien: 'pommes de terre, des vermicelles',
  ),
  Categorie(
    imageUrl: 'assets/categorie/soupe.jpg',
    name: 'Soupe Poisson',
    prix: '450 DA',
      nresto: 'Galerie' ,
      raiting:  '⭐⭐⭐',
    ingredien: 'pommes de terre, des vermicelles',
  ),
  Categorie(
    imageUrl: 'assets/categorie/Soupe/Soupe2.jpg',
    name: ' Soupe Normal',
    prix: '400 DA',
      nresto: 'BEF USA' ,
      raiting:  '⭐⭐⭐⭐',
    ingredien: 'pommes de terre, des vermicelles',
  ),
  Categorie(
    imageUrl: 'assets/categorie/Soupe/Soupep.jpg',
    name: 'Soupe lunette',
    prix: '350 DA',
      nresto: 'Arty' ,
      raiting:  '⭐⭐⭐',
    ingredien: 'pommes de terre, des vermicelles',
  ),
];

List<Categorie> Sandwich = [
  Categorie(
    imageUrl: 'assets/categorie/Sandwich/Humberger.jpg',
    name: 'Humberger',
    prix: '350 DA',
      nresto: 'Idel' ,
      raiting:  '⭐⭐⭐⭐',
    ingredien: 'composé de pain et d\'un assortiment simple, tel que le jambon, le fromage ou le thon',
  ),
  Categorie(
    imageUrl: 'assets/categorie/Sandwich/sandwich-USA.jpg',
    name: 'Sandwich USA',
    prix: '450 DA',
      nresto: 'Galerie' ,
      raiting:  '⭐⭐⭐⭐',
    ingredien: 'composé de pain et d\'un assortiment simple, tel que le jambon, le fromage ou le thon',
  ),
  Categorie(
    imageUrl: 'assets/categorie/Sandwich/Sandwich_viand.jpg',
    name: ' Sandwich Viand',
    prix: '400 DA',
      nresto: 'BEF USA' ,
      raiting:  '⭐⭐⭐⭐⭐',
    ingredien: 'composé de pain et d\'un assortiment simple, tel que le jambon, le fromage ou le thon',
  ),
  Categorie(
    imageUrl: 'assets/categorie/Sandwich/Tacos.jpg',
    name: 'Tacos',
    prix: '350 DA',
      nresto: 'Arty' ,
      raiting:  '⭐⭐⭐⭐⭐',
    ingredien: 'composé de pain et d\'un assortiment simple, tel que le jambon, le fromage ou le thon',
  ),
];

List<Categorie> Salade = [
  Categorie(
    imageUrl: 'assets/categorie/salad/Salade_healthy.jpg',
    name: 'Healthy Salade',
    prix: '350 DA',
      nresto: 'Idel' ,
      raiting:  '⭐⭐⭐⭐',
    ingredien: 'Croquante ou fondante, charnue ou légère, elle se déguste surtout en salade,'
  ),
  Categorie(
    imageUrl: 'assets/categorie/salad/Salad_thon.jpg',
    name: 'Salade Thon',
    prix: '450 DA',
      nresto: 'Galerie' ,
      raiting:  '⭐⭐⭐⭐⭐',
      ingredien: 'Croquante ou fondante, charnue ou légère, elle se déguste surtout en salade,'
  ),
  Categorie(
    imageUrl: 'assets/categorie/salad/Salad_poulet.jpg',
    name: ' Salade Poulet',
    prix: '400 DA',
      nresto: 'BEF USA' ,
      raiting:  '⭐⭐⭐',
      ingredien: 'Croquante ou fondante, charnue ou légère, elle se déguste surtout en salade,'
  ),
  Categorie(
    imageUrl: 'assets/categorie/Salade.jpg',
    name: 'Salade Simple',
    prix: '350 DA',
      nresto: 'Arty' ,
      raiting:  '⭐⭐⭐⭐',
      ingredien: 'Croquante ou fondante, charnue ou légère, elle se déguste surtout en salade,'
  ),
];

List<Categorie> favoris = [
  Categorie(
      imageUrl: 'assets/categorie/salad/Salade_healthy.jpg',
      name: 'Healthy Salade',
      prix: '350 DA',
      nresto: 'Galerie' ,
      raiting:  '⭐⭐⭐⭐',
      ingredien: 'Croquante ou fondante, charnue ou légère, elle se déguste surtout en salade,'
  ),
  Categorie(
    imageUrl: 'assets/categorie/Sandwich/Humberger.jpg',
    name: 'Humberger',
    prix: '350 DA',
    nresto: 'BEF USA' ,
    raiting:  '⭐⭐⭐⭐',
    ingredien: 'composé de pain et d\'un assortiment simple, tel que le jambon, le fromage ou le thon',
  ),
  Categorie(
    imageUrl: 'assets/categorie/Soupe/Soupe1.jpg',
    name: 'Soupe Légume',
    prix: '350 DA',
    nresto: 'Idel' ,
    raiting:  '⭐⭐⭐',
    ingredien: 'pommes de terre, des vermicelles',
  ),
  Categorie(
    imageUrl: 'assets/categorie/pizza.jpg',
    name: 'Pizza Végitarienne',
    prix: '350 DA',
    nresto: 'Arty' ,
    raiting:  '⭐⭐⭐⭐',
    ingredien: '1 pâte à pizza prête à dérouler , 150 g de dés (ou de lamelles) de jambon',

  ),

];
