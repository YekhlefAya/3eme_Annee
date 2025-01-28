// main.cpp
#include "Point.h"

using namespace std;

int main() {
//pp.affiche();
    // Création d'un point avec des coordonnées initiales
    Point p(2.0f, 3.0f);
    Point objet=p; // Point objet(p);
    // Affichage des coordonnées initiales
    p.affiche();

    // Déplacement du point
    p.deplace(1.5f, -0.5f);

    // Affichage des nouvelles coordonnées
    p.affiche();

    return 0;
}
