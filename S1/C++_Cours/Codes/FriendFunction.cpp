
#include <iostream>

using namespace std;

				// Les fonctions amies page 102.
		/* ************Fonction amie d'une classe ***************/
/*
class A {
	int a, b;
		public:
			A()  { }
			A(int x, int y):a(x),b(y) {
				 cout << "BONJOUR ";}
		friend void showA(A&);
};
void showA(A& x){
	cout << "A::a = " << x.a << " " << x.b;
}
int main()
{
A objet(4,3);		showA(objet); cout <<endl;
	return 0;
}
*/

		/* ***************** Exemple de fonction
					ind�pendante amie d�une classe *************** */

class point {
		int x, y ;
	public :
   //   point() :x(10), y(10){  cout << " chui la \n";  }
	 	point (int abs=10, int ord=10):x(abs),y(ord) // un constructeur ("inline")
			{ cout << "avc params "<< endl;}
        ~point() { cout << " DESTRUCTEUR" << x<< endl;}
		friend int coincide (point, point) ;   } ;
int coincide (point p, point q) // d�finition de coincide
    { if ((p.x == q.x) && (p.y == q.y)){ p.x=1000;
            return 1 ;}      else return 0 ; }
int main() {
    point a(10,10);
	point c ;
 		if (coincide (a,c)) cout << "a coincide avec b \n" ;
			else cout << "a et b sont differents \n" ;
			return 0;
			}


	/* ****** Fonction amie de plusieurs Classes ***** */
	// Prog: Demonstrates how friend functions work as a bridge between the classes

class ABC;		// forward declaration
class XYZ   {	int x;
	public:
		void set_data(int a)    {			x=a;        }
		friend void max(XYZ,ABC);
		~XYZ(){cout << "dest dial XYZ | "<< x << endl;}
};
class ABC   {   int y;
	public:
		void set_data(int a)    {  y=a;    }
	friend void max(XYZ,ABC);
		~ABC(){cout << "dest dial ABC "<< y << endl;}
};
void max(XYZ t1,ABC t2) {   if(t1.x>t2.y){  t1.x=100; cout<<t1.x;}
	else  { t2.y=100; cout<<t2.y << endl; }}
int main()  {   ABC _abc;
	XYZ _xyz;
	_xyz.set_data(20);
	_abc.set_data(35);
	max(_xyz,_abc); //callin friend function
	return 0;
}


			/* **********Exemple : Produit d�une matrice par un vecteur � l�aide
					//d�une fonction ind�pendante amie des deux classes****************************** */


// *********** La classe vect *******************
/*
	class matrice ; // pour pouvoir compiler la d�claration de vect
	class vect {
		double v[3] ; // vecteur � 3 composantes
		public :
			vect (double v1=0, double v2=0, double v3=0) // constructeur
					{ v[0] = v1 ; v[1]=v2 ; v[2]=v3 ; }
			friend vect prod(matrice,vect); //prod=fonction amie ind�pendante
			void affiche () {
					int i ;
					for (i=0 ; i<3 ; i++) cout << v[i] << " " ; cout << "\n" ;}
	} ;
// *********** La classe matrice *****************
	class matrice {
		double mat[3] [3] ; // matrice 3 X 3
		public :
			matrice (double t[3][3])//constructeur,� partir d�1tableau 3x3
					{ int i ; int j ;
						for (i=0 ; i<3 ; i++)
								for (j=0 ; j<3 ; j++)
									mat[i] [j] = t[i] [j] ; }
			friend vect prod(matrice,vect); //prod=fonction amie ind�pendante
	} ;
// ********** La fonction prod *****************
	vect prod (matrice m, vect x) {
		 int i, j ; double som ;
			vect res ; // pour le r�sultat du produit
				for (i=0 ; i<3 ; i++) {
					for (j=0, som=0 ; j<3 ; j++)
						som += m.mat[i] [j] * x.v[j] ;
					res.v[i] = som ; }
			return res ; }
main() {
		vect w (1,2,3) ; vect res ;
		double tb [3][3] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 } ;
			matrice a = tb ;
			res = prod(a, w) ;
			res.affiche () ;
			}

*/

			/* **************** FONCTION mmbre d'une classe
				 amie d'une autre classe ********************** */


class B;
class A {
		public:     void showB(B&);
};
class B {
		int b;
		public:
			B() { b = 70; }
			friend void A::showB(B& x); // Friend function
};
void A::showB(B& x)
{ std::cout << "B::b = " << x.b; 	}// Since showB() is friend of B, it can access private members of B
int main()
{
	A a;
	B t;
	a.showB(t);
	return 0;
}

*/


		/*    ******** Exemple : Produit d�une matrice par un vecteur � l�aide d�une
				//fonction membre amie d�une autre classe	*************** */

/*
class vect; // pour pouvoir compiler correctement
class matrice { // d�claration de la classe matrice
		double mat[3][3]; // marice 3x3
		public:
			matrice (double t[3][3]){		// constructeur
				int i, j;
					for(i=0;i<3;i++)
						for(j=0;j<3;j++)
							mat[i][j] = t[i][j];
					}
			vect prod(vect); // fonction membre
	};
class vect { // d�claration de la classe vect
		double v[3];
		public :
			vect (double v1=0,double v2=0,double v3=0){ //constructeur
				v[0]=v1; v[1]=v2; v[2]=v3;
			}
		friend vect matrice::prod(vect);
  		void affiche(){
						int i;
							for(i=0;i<3;i++) cout<<v[i]<<" " ;
							cout << endl;
							}
	};
 // fin de d�claration de la classe vect		.. d�finition de la fonction prod
	vect matrice::prod(vect x){
			int i,j; double som;
				vect res; //pour le r�sultat
					for (i=0;i<3;i++) {
						som = 0;
						for (j=0;j<3;j++)
						 	som += mat[i][j]*x.v[j];
							res.v[i] = som; }
					return res;
								}
int main() {
			vect w(1,2,3); vect res;
			double tb[3][3]={1,2,3,4,5,6,7,8,9};
			matrice a = tb;
			res= a.prod(w); res.affiche();
	return 0; }
		*/


	/* ****************	 CLASS FRIEND OF ANOTHER CLASS ************************ */
/*
    class A
    { int x =5;
        public :
       friend class B;           // friend class.
    };
    class B
    {
      public:
        void display(A &a)
        {
            cout << " value of x is : " <<a.x;
        }
    };
    int main()
    {
        A a;
        B b;
        b.display(a);
        return 0;
    }
*/
