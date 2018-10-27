`include "Numero.v"//Incluíndo o módulo com as equações

module Codigo_Morse_FPGA(LEDG, LEDR, SW);//Definição do que será utilizado na FPGA

input 		    [17:0]		SW;//Definindo como entrada os Switches da FPGA

output		     [8:0]		LEDG;//Definindo como saída os LEDs verdes

output		    [17:0]		LEDR;//Definindo como saída os LEDs vermelhos

//Instanciando o módulo Numero.v com suas respectivas entradas e saídas

Numero moduloNumero (.A(SW[3]), .B(SW[2]), .C(SW[1]), .D(SW[0]), .d1(LEDG[0]), .d2(LEDG[1]), .d3(LEDG[2]), .d4(LEDG[3]), .d5(LEDG[4]), .reset(SW[17]), .ready(SW[16]), .Ativa_vermelho(LEDR[17]));

 /*
  A = Primeira Entrada e Switch de número 3
  B = Segunda Entrada e Switch de número 2
  C = Terceira Entrada e Switch de número 1
  D = Quarta Entrada e Switch de número 0
  d5 = Primeira saída e LED Verde de número 4
  d4 = Segunda saída e LED Verde de número 3
  d3 = Terceira saída e LED Verde de número 2
  d2 = Quarta saída e LED Verde de número 1
  d1 = Última saída e LED Verde de número 0
  Reset = Entrada para voltar as saídas para seu valor inicial (0) e Switch de número 17
  Ready = Entrada para indicar que as entradas estão prontas e a saída pode ser exibida e Switch de número 16
  Ativa_vermelho = Indica se o valor de entrada é maior que 9 (Valor Inválido) e usa o LED Vermelho de número 17
 */

endmodule//Fim do módulo
