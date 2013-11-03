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

