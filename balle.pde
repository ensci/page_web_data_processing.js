Etiquette[] etiquette= new Etiquette[1];

// ma classe Etiquette va contenir les informations nécessaire à la création d'un objet Etiquette. Chaque Etiquette va contenir un numéro
// de téléphone et sera indépendante des autres.
class Etiquette {

  String phoneNumber; // ma variable qui contient le numéro de téléphone sous forme de texte

  float x, y; // la position x et y de mon objet
  float vitesseX, vitesseY; // la vitesse de mon objet

  // le setup de mon Etiquette 
  Etiquette(String phoneNumber) { // je récupère le numéro à la création de l'objet
   
    this.phoneNumber= phoneNumber; // je transfert ce numéro dans ma variable créée plus haut

    // j'indique une position aléatoire lors de la création de l'objet
    x=int(random(0, 600)); 
    y=int(random(0, 500));
    // j'indique une vitesse aléatoire lors de la création de l'objet    
    vitesseX=random(-1, 1);
    vitesseY=random(-1, 1);
  }

  void update() {
    // je vais additioner la vitesse de l'objet à sa position à chaque mise à jour de l'écran afin de l'animer
    x+=vitesseX;
    y+=vitesseY;

// je teste si mon objet est toujours dans l'écran. Si ce n'est pas le cas, je vais inverser sa vitesse
// pour qu'il reparte dans l'autre sens. Je vais au passage augmenter sa vitesse (+0.01) 
    if (x>720) {
      vitesseX=-vitesseX+0.01;
    }
    if (y>575) {
      vitesseY=-vitesseY+0.01;
    }
    if (x<0) {
      vitesseX=-vitesseX+0.01;
    }
    if (y<0) {
      vitesseY=-vitesseY+0.01;
    }
  }


  void draw () {
    // j'appelle la fonction update (cf. plus haut) qui prend en charge l'animation
    update();

// je créé un rectangle 
    fill (0);
    rect (x, y, 80, 25, 5);
    textFont(font1, 12);
    fill(255);
 // j'affiche mon numéro de téléphone sous forme de texte   
    text(phoneNumber, x+6, y+18);
  }
}

