
// Point.cpp
#include <iostream>
#include "Point.h"

// Constructeur initialisant les coordonnées
Point::Point(float x, float y) : x(x), y(y) {}

Point::Point(const Point& other) {
        x=other.x;
        y= other.y;
        }

// Fonction pour déplacer le point par une translation
void Point::deplace(float dx, float dy) {
    x += dx;
    y += dy;
}

// Fonction pour afficher les coordonnées du point
void Point::affiche() const {
    std::cout << "Coordonnées : (" << x << ", " << y << ")" << std::endl;
}
