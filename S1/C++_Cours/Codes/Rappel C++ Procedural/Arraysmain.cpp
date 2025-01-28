#include <iostream>
using namespace std;

/*
void inverserTableau(int* , int );

void afficherTableau(int tab[], int taille) {
    std::cout << "Elements du tableau : ";
    for (int i = 0; i < taille; i++) {
        std::cout << tab[i] << " ";
    }
    std::cout << std::endl;
}
int sommeTableau(int tab[], int taille) {
    int somme = 0;
    for (int i = 0; i < taille; i++) {
        somme += tab[i];
    }
    return somme;
}
int maximumTableau(int tab[], int taille) {
    int max = tab[0]; // On suppose que le premier élément est le plus grand
    for (int i = 1; i < taille; i++) {
        if (tab[i] > max) {
            max = tab[i];
        }
    }
    return max;
}




void modifierTableauAvecPointeurs(int* tab, int taille) {
    for (int i = 0; i < taille; i++) {
        //*(tab + i) += 10; // Ajoute 10 à chaque élément
        tab[i] += 100;
    }
}

int main() {
    const int taille = 5;
    int tableau[taille];
    std::cout << "Entrez 5 entiers : ";
    for (int i = 0; i < taille; i++) {
        std::cin >> tableau[i];
    }
    afficherTableau(tableau, taille);
    std::cout << "Somme des elements : " << sommeTableau(tableau, taille) << std::endl;
    std::cout << "Element maximum : " << maximumTableau(tableau, taille) << std::endl;
    inverserTableau(tableau, taille);
    std::cout << "Tableau apres inversion : ";
    afficherTableau(tableau, taille);
    modifierTableauAvecPointeurs(tableau, taille);
    std::cout << "Tableau apres modification avec pointeurs (ajout de 10 à chaque élément) : ";
    afficherTableau(tableau, taille);

    return 0;
}

void inverserTableau(int tab[], int taille) {
    int debut = 0;
    int fin = taille - 1;
    while (debut < fin) {
        // Échange des éléments
        int temp = tab[debut];
        tab[debut] = tab[fin];
        tab[fin] = temp;
        debut++;
        fin--;
    }
}

*/
/*
 int*  increment (int );
    int*  increment (int* );
int main() {
   int x=10;
   int* t= increment(x);                (*t)+=10; cout << " noud ldarkom ";
    cout << "val of "<<  x << "after increment : " << *t << endl;
    int* z=increment(&x);               (*z)+=100;
        cout << "val of "<<  x << "after increment : " << *z << endl;
return 0;
}
            int*  increment (int a){
                cout << "IN FUNCTION @: " << a << " | " << &a << endl;          a+=100;
                cout << "IN FUNCTION " << a << " | " << &a << endl;
                    return &a;
                }

            int*  increment (int* a){
            cout << "IN FUNCTION @: " << *a << " | " << a << endl;          (*a)+=100;
                cout << "IN FUNCTION " << *a << " | " << a << endl;
                return a;
            }
*/
/*
#include <iostream>
using namespace std;

    void afficher(int* tableau, int taille) {
    for (int i = 0; i < taille; ++i) {
        cout << tableau[i] << " " << endl;
    }
}
int main() {
    int n;
    cout << "Entrez la taille du tableau: ";
    cin >> n;
    int* tableau = new int[n];
    int* f = new int;
    for (int i = 0; i < n; ++i) {
        tableau[i] = i + 1;
    }
    afficher(tableau, n);
    delete[] tableau;
    delete f;

    return 0;
}
*/
/*
#include <iostream>
using namespace std;

void afficher(int* tableau, int taille) {
    for (int i = 0; i < taille; ++i) {
        cout << tableau[i] << " ";
    }
    cout << endl;
}
int main() {
    int n;
    cout << "Entrez la taille du tableau: ";
    cin >> n;
    int* tableau = new int[n];
    for (int i = 0; i < n; ++i) {
        tableau[i] = i + 1;
    }
    cout << "Contenu du tableau: ";
    afficher(tableau, n);
    delete[] tableau;

    return 0;
}

*/





