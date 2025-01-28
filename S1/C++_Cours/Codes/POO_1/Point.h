// Point.h
#ifndef POINT_H
#define POINT_H

class Point {

    float x;
    float y;

public:
    // Constructeur avec les coordonn�es comme arguments
    Point(float , float );
    Point(const Point&);

    // Fonction membre pour d�placer le point
    void deplace(float , float );

    // Fonction membre pour afficher les coordonn�es
    void affiche() const;
};

#endif // POINT_H

