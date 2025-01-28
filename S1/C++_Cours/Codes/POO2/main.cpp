#include <iostream>
#include <string>

using namespace std;

class Livre {
private:
    string titre;
    string auteur;
    double prix;
    int nbPages;

public:
    // Constructeur par défaut
    Livre() :  titre("inconnu"), auteur("inconnu"), prix(0.0), nbPages(0)
 {
        cout <<" l'@ dial titre" << &titre<< endl ;
        cout << "Constructeur par défaut appelé." << endl;
    }
    // Constructeur avec tous les paramètres
    Livre(const string& titre,const string& auteur, double prix, int nbPages) : titre(titre), auteur(auteur), prix(prix),nbPages(nbPages)
     {
       //this->titre= titre;
     //   this->auteur= auteur;
        cout << "Constructeur avec tous les paramètres appelé." << endl;
    }

    // Constructeur avec titre et auteur seulement
    Livre(const string& titre, const string& auteur) {
        this->titre = titre;
        this->auteur = auteur;
        prix = 0.0;
        nbPages = 0;
        cout << "Constructeur avec titre et auteur appelé." << endl;
    }

    // Constructeur de copie
    Livre(const  Livre& autreLivre): titre(autreLivre.titre) {
       // autreLivre.prix=700;
      //  this->titre = autreLivre.titre;
        auteur = autreLivre.auteur;
        prix = autreLivre.prix;
        nbPages = autreLivre.nbPages;
        cout << "Constructeur de copie appelé pour le livre : " << titre << endl;
    }

    // Destructeur
    ~Livre() {
        cout << "Destructeur appelé pour le livre : " << titre << endl;
    }

    // Méthode pour afficher les informations du livre
    void afficher() const {
        cout << "Titre : " << titre << endl;
        cout << "Auteur : " << auteur << endl;
        cout << "Prix : " << prix << " EUR" << endl;
        cout << "Nombre de pages : " << nbPages << endl;
    }

    // Méthode pour mettre à jour le prix du livre
    void mettreAJourPrix(double nouveauPrix) {
        prix = nouveauPrix;
        cout << "Le prix a été mis à jour à " << prix << " EUR." << endl;
    }

    // Méthode pour ajouter des pages au livre
    void ajouterPages(int pagesSupplementaires) {
        if (pagesSupplementaires > 0) {
            nbPages += pagesSupplementaires;
            cout << pagesSupplementaires << " pages ont été ajoutées." << endl;
        } else {
            cout << "Le nombre de pages supplémentaires doit être positif." << endl;
        }
    }
};

int main() {
    // Création d'un livre avec le constructeur par défaut
    Livre livre1;   cout <<"l'@ est  : "<<  &livre1 << endl;
    livre1.afficher();

    cout << endl;

    // Création d'un livre avec le constructeur paramétré
    Livre livre2("Harry Potter", "J.K. Rowling", 20.0, 500);
    livre2.afficher();

    cout << endl;

    // Création d'un livre par copie
    Livre livre3 (livre2);
    livre3.afficher();

    cout << endl;

    // Modification du livre copié
    livre3.mettreAJourPrix(25.0);
    livre3.ajouterPages(50);
    livre3.afficher();

    cout << endl;

    // Fin de la fonction main, les destructeurs seront appelés
    return 0;
}
