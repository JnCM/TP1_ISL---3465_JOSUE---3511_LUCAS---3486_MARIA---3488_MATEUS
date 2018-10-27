`include "Numero.v"//Incluíndo o módulo com as equações

module Codigo_Morse_FPGA(LEDG, LEDR, SW);//Definição do que será utilizado na FPGA

input 		    [17:0]		SW;//Definindo como entrada os Switches da FPGA
output		     [8:0]		LEDG;//Definindo como saída os LEDs verdes
output		    [17:0]		LEDR;//Definindo como saída os LEDs vermelhos

//Instanciando o módulo Numero.v com suas respectivas entradas e saídas

Numero moduloNumero (.A(SW[17]), .B(SW[16]), .C(SW[15]), .D(SW[14]), .d1(LEDR[13]), .d2(LEDR[14]), .d3(LEDR[15]), .d4(LEDR[16]), .d5(LEDR[17]), .reset(SW[0]), .ready(SW[1]), .Mostra_Errado(LEDG[8]));

  /*
  A = Primeira Entrada e Switch de número 17
  B = Segunda Entrada e Switch de número 16
  C = Terceira Entrada e Switch de número 15
  D = Quarta Entrada e Switch de número 14
  d5 = Primeira saída e LED Vermelho de número 17
  d4 = Segunda saída e LED Vermelho de número 16
  d3 = Terceira saída e LED Vermelho de número 15
  d2 = Quarta saída e LED Vermelho de número 14
  d1 = Última saída e LED Vermelho de número 13
  Reset = Entrada para voltar as saídas para seu valor inicial (0) e Switch de número 0
  Ready = Entrada para indicar que as entradas estão prontas e a saída pode ser exibida e Switch de número 1
  Mostra_Errado = Indica se o valor de entrada é maior que 9 (Valor Inválido) ou se o Reset está ativado e usa o LED Verde de número 8
  */
endmodule//Fim do módulo
