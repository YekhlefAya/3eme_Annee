// main.cpp
#include "Point.h"

using namespace std;

int main() {
//pp.affiche();
    // Cr�ation d'un point avec des coordonn�es initiales
    Point p(2.0f, 3.0f);
    Point objet=p; // Point objet(p);
    // Affichage des coordonn�es initiales
    p.affiche();

    // D�placement du point
    p.deplace(1.5f, -0.5f);

    // Affichage des nouvelles coordonn�es
    p.affiche();

    return 0;
}
