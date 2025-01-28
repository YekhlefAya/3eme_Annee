
// Point.cpp
#include <iostream>
#include "Point.h"

// Constructeur initialisant les coordonn�es
Point::Point(float x, float y) : x(x), y(y) {}

Point::Point(const Point& other) {
        x=other.x;
        y= other.y;
        }

// Fonction pour d�placer le point par une translation
void Point::deplace(float dx, float dy) {
    x += dx;
    y += dy;
}

// Fonction pour afficher les coordonn�es du point
void Point::affiche() const {
    std::cout << "Coordonn�es : (" << x << ", " << y << ")" << std::endl;
}
