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
    // Constructeur par d�faut
    Livre() :  titre("inconnu"), auteur("inconnu"), prix(0.0), nbPages(0)
 {
        cout <<" l'@ dial titre" << &titre<< endl ;
        cout << "Constructeur par d�faut appel�." << endl;
    }
    // Constructeur avec tous les param�tres
    Livre(const string& titre,const string& auteur, double prix, int nbPages) : titre(titre), auteur(auteur), prix(prix),nbPages(nbPages)
     {
       //this->titre= titre;
     //   this->auteur= auteur;
        cout << "Constructeur avec tous les param�tres appel�." << endl;
    }

    // Constructeur avec titre et auteur seulement
    Livre(const string& titre, const string& auteur) {
        this->titre = titre;
        this->auteur = auteur;
        prix = 0.0;
        nbPages = 0;
        cout << "Constructeur avec titre et auteur appel�." << endl;
    }

    // Constructeur de copie
    Livre(const  Livre& autreLivre): titre(autreLivre.titre) {
       // autreLivre.prix=700;
      //  this->titre = autreLivre.titre;
        auteur = autreLivre.auteur;
        prix = autreLivre.prix;
        nbPages = autreLivre.nbPages;
        cout << "Constructeur de copie appel� pour le livre : " << titre << endl;
    }

    // Destructeur
    ~Livre() {
        cout << "Destructeur appel� pour le livre : " << titre << endl;
    }

    // M�thode pour afficher les informations du livre
    void afficher() const {
        cout << "Titre : " << titre << endl;
        cout << "Auteur : " << auteur << endl;
        cout << "Prix : " << prix << " EUR" << endl;
        cout << "Nombre de pages : " << nbPages << endl;
    }

    // M�thode pour mettre � jour le prix du livre
    void mettreAJourPrix(double nouveauPrix) {
        prix = nouveauPrix;
        cout << "Le prix a �t� mis � jour � " << prix << " EUR." << endl;
    }

    // M�thode pour ajouter des pages au livre
    void ajouterPages(int pagesSupplementaires) {
        if (pagesSupplementaires > 0) {
            nbPages += pagesSupplementaires;
            cout << pagesSupplementaires << " pages ont �t� ajout�es." << endl;
        } else {
            cout << "Le nombre de pages suppl�mentaires doit �tre positif." << endl;
        }
    }
};

int main() {
    // Cr�ation d'un livre avec le constructeur par d�faut
    Livre livre1;   cout <<"l'@ est  : "<<  &livre1 << endl;
    livre1.afficher();

    cout << endl;

    // Cr�ation d'un livre avec le constructeur param�tr�
    Livre livre2("Harry Potter", "J.K. Rowling", 20.0, 500);
    livre2.afficher();

    cout << endl;

    // Cr�ation d'un livre par copie
    Livre livre3 (livre2);
    livre3.afficher();

    cout << endl;

    // Modification du livre copi�
    livre3.mettreAJourPrix(25.0);
    livre3.ajouterPages(50);
    livre3.afficher();

    cout << endl;

    // Fin de la fonction main, les destructeurs seront appel�s
    return 0;
}
