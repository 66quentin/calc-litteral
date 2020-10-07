Réalisé par Quentin Guardia (qguardia66@gmail.com)

Compiler:
make

Utiliser:
./exo < exp.txt

Nettoyer:
make clean

Grammaire utilisée:
G={V,Σ,S,R} avec :
V={S,A,val,(,),*,-,+,/,^,=} 
Σ={val,(,),*,-,+,/,^,=}
R={S → val=A;A → (A) | A*A | A-A | A+A | A/A | A^A | val}
