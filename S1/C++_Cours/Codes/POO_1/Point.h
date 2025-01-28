// Point.h
#ifndef POINT_H
#define POINT_H

class Point {

    float x;
    float y;

public:
    // Constructeur avec les coordonnées comme arguments
    Point(float , float );
    Point(const Point&);

    // Fonction membre pour déplacer le point
    void deplace(float , float );

    // Fonction membre pour afficher les coordonnées
    void affiche() const;
};

#endif // POINT_H

