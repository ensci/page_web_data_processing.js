/* @pjs font="DINMITTELSCHRIFT-REGULAR.TTF"; 
 */

// je déclare ma variable PFont qui correspond à ma police
PFont font1;

void setup() {

  // la taille de mon objet processing = taille du canvas
  size (800, 600);
  background (255);

  // je charge ma police (format .ttf) que j'ai placé dans mon dossier "data", j'indique sa taille
  font1=createFont( "DINMITTELSCHRIFT-REGULAR.TTF", 12);
}


void draw () {
  // un fond blanc avec une légère transparence
  background(255, 128);

  // si je clique sur le bouton sur ma page web, le booléen boutonActif va être "vrai"
  if (boutonActif== true) {

    // je vais créer un tableau d'objets Etiquette, la taille de mon tableau (array) correspond à la quantité de numéros de téléphone que j'ai récupéré
    etiquette = new etiquette[items.length];

    // je créé une boucle qui va chercher dans mon tableau d'objets Etiquette que je viens de créer
    for (int i=0; i<etiquette.length; i++) {
      // je crée un nouvel objet Etiquette et je lui attribue en argument le numéro de téléphone correspondant
      etiquette[i]= new Etiquette(items[i]);
    }

    // je remet le booleen boutonActif sur faux, car je veux créer les objets une seule fois
    boutonActif = false;
  }


  // je créer une boucle qui va chercher à travers mes objets Etiquettes
  for (int i=0; i<etiquette.length; i++) {
    // je vérifie que mon objet Etiquette existe
    if (etiquette[i]!=null) {
      // je vais appeler la fonction draw de ma classe Etiquette pour la dessiner
      etiquette[i].draw();
    }
  }
}

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


