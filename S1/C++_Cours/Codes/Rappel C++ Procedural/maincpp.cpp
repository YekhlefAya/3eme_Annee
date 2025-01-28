
#include <iostream>

using namespace std; 

/*int main() {
	
	int somme=0, nbr, i;
	
	cout << " Entrez un nombre: " << endl;
  	cin >> nbr ;
  
  for(i = 1; i < nbr; i++){
    if(nbr%i == 0){
      somme = somme + i;
    }
  }
  if(somme == nbr){
    cout <<" Nombre parfait";
  }  
  else{
    cout <<" n'est pas un Nombre parfait";
  }
	
	return 0;
}*/


/*main() {
 void echange (int &a, int &b) ;
  int n=10, p=20 ;
cout << "avant appel : " << n << " " << p << "\n" ;
echange (n, p) ;
cout << "apres appel : " << n << " " << p << "\n" ; }


void echange (int &a, int& b) { int c ;
cout << "debut echange : "<< a << " " << b << "\n" ;
c = a ; a = b ; b = c ;
cout << "fin echange : " << a << " " << b << "\n" ; }
*/


/*int main()
{
    int x = 10;
 
    // ref is a reference to x.
    int& ref = x;
 
    // Value of x is now changed to 20
    ref = 20;
    cout << "x = " << x << '\n';
 
    // Value of x is now changed to 30
    x = 30;
    cout << "ref = " << ref << '\n';
 
    return 0;
}*/


// Function declaration
/*void myFunction();

// The main method
int main() {
  myFunction();  // call the function
  return 0;
}

// Function definition
void myFunction() {
  cout << "Bien executer";
}
*/

/*void swapNums(int& x, int& y) {
  int z = x;
  x = y;
  y = z;
}

int main() {
  int firstNum = 10;
  int secondNum = 20;

  cout << "Before swap: " << "\n";
  cout << firstNum << secondNum << "\n";

  // Call the function, which will change the values of firstNum and secondNum
  swapNums(firstNum, secondNum);

  cout << "After swap: " << "\n";
  cout << firstNum << secondNum << "\n";

  return 0;
}*/

/*
  max(int a, int b){
	int c;
	a > b ? cout << a : cout << b;
//	cout << a;
//	else << b;
}

int main() {
	
	int z=10, x=20, y;
	max(x,y);
//	cout << y;
	
return 0;
}
*/


/*double ma_fonction(int u, float f){
		return(u+10*f);
					}
int main() {
	
char c='A'; int i=100, j=150; float r=5.7; double r1, r2, r3, r4;

r1 = ma_fonction( i, r );
r2 = ma_fonction( c, r);
r3 = ma_fonction( i, j);
r4 = ma_fonction( r, j);

cout<<r1<<endl; cout<<r2<<endl;cout<<r3<<endl;cout<<r4<<endl;
*/
/*
void f1(int n=3){
	cout << "Bonjour F1 " << endl;
}
void f2(int n, float x=2.35){
	cout << "Bonjour F2 " << endl;
}
void f3(char c,int n=3, float x=2.35){
	cout << "Bonjour F3 " << endl;
}

int main(){
	char a = 0; int i = 2; float r = 5.6;
f1(i); // l�initialisation par d�faut est ignor�e.
f1(); // l�argument i prend la valeur par d�faut.
f2(i,r); // les initialisations par d�faut sont ignor�es
f2(i); // le second param�tre prend la valeur par d�faut.
//f2(); // interdit.
f3(a, i, r); // les initialisations par d�faut sont ignor�es.
f3(a, i); // le troisi�me param�tre prend la valeur par d�faut.
f3(a); //
	
*/

// FONCTIONS DE MM NOMS DITS OVERLOADING OU SURCHARGE 

/*
void essai(float x, char c, int n=0)
{ cout<<"Fonction N�1: x = " << x << " c = " <<c<< " n = "<<n<<"\n"; }
void essai(float x, int n) 
{ cout<<"Fonction N�2: x = "<< x <<" n = "<< n <<"\n"; }
int main() {
char l='z';int u=4;float y = 2.0;
essai(y,l,u); // fonction N�1
essai(y,l); // fonction N�1
essai(y,u); // fonction N�2
essai(u,u); // fonction N�2
essai(u,l); // fonction N�1
// essai(y,y); rejet par le compilateur
essai(y,y,u); // fonction N�1
return 0; }
// FIN FUNC
*/

//Passage PAr VAL / PNT/ REF
/*
void passparValeur(int val);
void passparReference(int& ref);
void passparPointeur(int* ptr);


int main(){
	int x=5;
	printf("x= %d \n", x);
	passparValeur(x);
	printf("x apres passage par val = %d \n", x);
	passparReference(x);
	printf("x apres passage par ref= %d \n", x);
	passparPointeur(&x);
	printf("x apres passage par ptr= %d \n", x);
	
	return 0;
}


void passparValeur(int val){
	val=10;
	cout << " La valeur est "<< val << endl; 
}

void passparReference(int& ref){
	ref =20;
	cout << " La reference est "<< ref << endl; 
}

void passparPointeur(int* ptr){
	*ptr = 30;
	cout << " Le pointeur est "<< *ptr << endl; 
}
*/




/*
void myFunction(string country = "Norway") {
  cout << country << "\n";
}

int main() {
  myFunction("Sweden");
  myFunction("India");
  myFunction();
  myFunction("USA");
  return 0;
}

*/
/*
void myFunction(int a, string fname, int age) {
  cout << a << "   OKKKK  " << fname << " JR. " << age << " years old. \n";
}

int main() {
  myFunction(3, "Amine", 30);
  myFunction(40,"Mohamed", 400);
  //myFunction("Mohamed", 30);
  
return 0;
}
*/



/* LES TABLEAUX */
/*
	#include <iostream>

// Fonction pour afficher les éléments du tableau
void afficherTableau(int tab[], int taille) {
    std::cout << "Éléments du tableau : ";
    for (int i = 0; i < taille; i++) {
        std::cout << tab[i] << " ";
    }
    std::cout << std::endl;
}

// Fonction pour calculer la somme des éléments du tableau
int sommeTableau(int tab[], int taille) {
    int somme = 0;
    for (int i = 0; i < taille; i++) {
        somme += tab[i];
    }
    return somme;
}

// Fonction pour trouver le maximum du tableau
int maximumTableau(int tab[], int taille) {
    int max = tab[0]; // On suppose que le premier élément est le plus grand
    for (int i = 1; i < taille; i++) {
        if (tab[i] > max) {
            max = tab[i];
        }
    }
    return max;
}

// Fonction pour inverser les éléments du tableau
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

// Fonction pour modifier les éléments du tableau avec des pointeurs
void modifierTableauAvecPointeurs(int* tab, int taille) {
    for (int i = 0; i < taille; i++) {
        *(tab + i) += 10; // Ajoute 10 à chaque élément
    }
}

int main() {
    const int taille = 5;
    int tableau[taille];

    // Initialisation du tableau avec des valeurs saisies par l'utilisateur
    std::cout << "Entrez 5 entiers : ";
    for (int i = 0; i < taille; i++) {
        std::cin >> tableau[i];
    }

    // Affichage du tableau
    afficherTableau(tableau, taille);

    // Calcul et affichage de la somme des éléments
    std::cout << "Somme des éléments : " << sommeTableau(tableau, taille) << std::endl;

    // Recherche et affichage de l'élément maximum
    std::cout << "Élément maximum : " << maximumTableau(tableau, taille) << std::endl;

    // Inversion des éléments et affichage du tableau inversé
    inverserTableau(tableau, taille);
    std::cout << "Tableau après inversion : ";
    afficherTableau(tableau, taille);

    // Modification du tableau à l'aide des pointeurs
    modifierTableauAvecPointeurs(tableau, taille);
    std::cout << "Tableau après modification avec pointeurs (ajout de 10 à chaque élément) : ";
    afficherTableau(tableau, taille);

    return 0;
}

*/


// CLASS OBJECT CHAPTER ----------------------------
/*
struct car {
  string brand;
  string model;
  int year;
  char c;
};

int main() {
  // Create a car structure and store it in myCar1;
  car myCar1;
  //myCar1.brand = "BMW";
  //myCar1.model = "X5";
  //myCar1.year = 1999;
  //myCar1.c='B';
  
  myCar1={"BMW","X6",1999,'B'};

  // Create another car structure and store it in myCar2;
  car myCar2;
  myCar2.brand = "Ford";
  myCar2.model = "Mustang";
  myCar2.year = 1969;
  myCar2.c='D';
 
  // Print the structure members
  cout << myCar1.brand << " " << myCar1.model << " " << myCar1.year << " " << myCar1.c << "\n";
  cout << myCar2.brand << " " << myCar2.model << " " << myCar2.year << " " << myCar2.c  << "\n";
 
  return 0;
}
*/


/* ------------ D�claration du STRUUUCT point ------------- */
/*
class point { // d�claration "classique" des donn�es 
	int x ; int y ;
// d�claration des fonctions membres (m�thodes) 
void initialise (int, int) ; void deplace (int, int) ; void affiche () ;
 };
// ---- D�finition des fonctions membres du type point --- 
	void point::initialise (int abs, int ord) { x = abs ; y = ord ; }
	void point::deplace (int dx, int dy) { x += dx ; y += dy ; }
	void point::affiche () { cout << "Je suis en " << x << " " << y << "\n" ; }
main() { 
	point a, b ;
	a.x=5,a.y=7;
	//a.initialise (5, 2) ; 
	a.affiche() ;
	a.deplace (-2, 4) ; a.affiche() ;
	b.initialise (1,-1) ; b.affiche() ;
}
*/

// LES CLASSES 

class point { // d�claration des membres priv�s 
		public	:
				 int x ;
				 int y ;
		public : 	 			
			void initialise (int abs, int ord) {
 					x = abs ;
					y = ord ;
						}							
			void deplace (int dx, int dy) {
					x = x + dx ;
					y = y + dy ;
							}	
			void affiche () {
 					cout << " address " << this << " | Je suis en " << x << " " << y << "\n" ;
			 			}
} ;
main() { 
		point p;
		point Objet1;
		p.x=5; p.y=22;
		p.affiche() ;			
		//Objet1.initialise (7, 2) ;	Objet1.affiche () ;
		//Objet1.deplace (-2, 4) ;
		//Objet1.affiche () ;
		//Objet2.initialise (1,-1) ;
		//Objet2.affiche () ; 	
	}


/* ----------- D�claration de la classe point ------------- */
/*
class point { // d�claration des membres priv�s 
		//public :
				 int x ;
				 int y ;
		public : 		
		//void initialise (int, int) ;
		point (); // Constructeur Vide
		point (int, int) ; // Constructeur avec des param�tres
		void deplace (int, int) ;
		void affiche () ;		
	 		} ;
	point::point() { 	
//			x=200; y=300;
 			cout << "x= " << x <<" y= " << y << endl;
		}
	point::point (int abs, int ord) { 
			x = abs ;
			y = ord ;
			}
				
	void point::deplace (int dx=10, int dy=10) {
			x = x + dx ;
			y = y + dy ;
							}
	void point::affiche () {
 			cout << "Je suis en " << x << " " << y << "\n" ;
			 			}
main(){	
	point p1; 
	point p2(3,6);
	//p1.deplace(5,5);
	//point p2(150,150);
	p1.affiche();
	//p2.affiche();
}	
*/	 			
// **************** USE OF SEMI COLON IN THE END OF CLASS ----------------
/*

class Demo{
   int a, b;
    public:
    Demo()   // default constructor
    {
        cout << "Default Constructor" << endl;
    }
    Demo(int a, int b):a(a),b(b)  //parameterised constructor
    {
        cout << "parameterized constructor -values " << a  << " "<< b << endl;
    }
     
} inst, inst;
//instance(4,5);
int main() {
	//Demo inst;
	//Demo instance(1,2);
	inst.x
	
    return 0;
}
*/	
