%-- Hallar la solución de Ecuaciones de Recurrencia--%

syms x;

n = input('Bienvenido, pro favor digite el grado de la ecuación de recurrencia');
string Cond[n];
bool Repetidos;

string Ecuacion;
Ecuacion=input('Digite la Ecuacion de Recurrencia normalizada');

Raices= solve(Ecuacion);
