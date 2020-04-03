#include <stdio.h>
#include <stdlib.h>

int pantallaInicial();
float calculo();
float suma();
float resta();
float multiplicacion();
float division();

int main()
{
  int operacion = 0;
  char bandera;

  printf("Bienveniido a la calculadora que desarrollamos para practicar C !\n");
  do
  {
    operacion = pantallaInicial();

    if (operacion>0 && operacion<5) {
      printf("\n\nEl resultado de tu operacion es: %f\n\n", calculo(operacion));
    }
    else if (operacion!=5)
    {
      printf("La opcion elegida no es valida. Intentelo de nuevo.\n");
    }
    else 
    {
      printf("\nSeguro que desea salir de esta fantastica calculadora? (S/N)");
      scanf(" %c", &bandera);

      while (!(bandera=='s' || bandera=='S' || bandera=='n' || bandera=='N')) {
        printf("Tu eleccion no es valida, inserte una que si: (S/N)");
	scanf(" %c", &bandera);
      }

      if(bandera=='n' || bandera=='N')
      {
	operacion = 0;
      }
    }
  }
  while(operacion!=5);

  printf("Adios, espero que haya sido util !!\n");

  return 0;
}

int pantallaInicial()
{
  int opcionElegida = 0;

  printf("\nOpciones:\n");
  printf("> 1 - Sumar\n");
  printf("> 2 - Restar\n");
  printf("> 3 - Multiplicar\n");
  printf("> 4 - Dividir\n");
  printf("\n> 5 - Salir\n\n");
  scanf("%d", &opcionElegida);

  return opcionElegida;
}

float calculo(int operacion)
{

  float resultado;

  switch (operacion)
  {
    case 1:
	    resultado = suma();
	    break;
    case 2:
	    resultado = resta();
	    break;
    case 3:
	    resultado = multiplicacion();
	    break;
    case 4:
	    resultado = division();
	    break;
  }

  return resultado;
}

float suma()
{
  float operador1,
	operador2;

  printf("\nEstas en la funcion suma!\n\n");

  printf("¿Cual es el primer numero?  ");
  scanf("%f", &operador1);

  printf("¿Cual es el segundo numero?  ");
  scanf("%f", &operador2);

  return operador1 + operador2;
}

float resta()
{
  float operador1,
	operador2;

  printf("\nEstas en la funcion resta!\n\n");

  printf("¿Cual es el primer numero?  ");
  scanf("%f", &operador1);

  printf("¿Que numero queres restarle?  ");
  scanf("%f", &operador2);

  return operador1 - operador2;
}

float multiplicacion()
{
  float operador1,
	operador2;

  printf("\nEstas en la funcion multiplicacion!\n\n");

  printf("¿Cual es el primer numero?  ");
  scanf("%f", &operador1);

  printf("¿Cual es el segundo numero?  ");
  scanf("%f", &operador2);

  return operador1 * operador2;
}

float division()
{
  float operador1,
	operador2;

  printf("\nEstas en la funcion division!\n\n");

  printf("¿Cual es el primer numero?  ");
  scanf("%f", &operador1);
  
  printf("¿Por cual queres dividirlo?  ");
  scanf("%f", &operador2);

  while(operador2==0)
  {
    printf("No se puede dividir por 0, ingrese un numero valido:  ");
    scanf("%f", &operador2);
  }

  return operador1 / operador2;
}
