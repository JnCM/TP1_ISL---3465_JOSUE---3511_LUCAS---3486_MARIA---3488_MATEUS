module Numero(A, B, C, D, d1, d2, d3, d4, d5, reset, ready, Mostra_Errado);//parametros
	input wire A, B, C, D, reset, ready;//entradas como fios, já que vão passar os valores para a equação
	output reg d1, d2, d3, d4, d5, Mostra_Errado;//saidas como registradores, já que irão guardar os valores da equação
	always @(*) begin//bloco always que é executado sempre quando o ready for 1
		if(reset | {A, B, C, D} >= 4'b1010) begin//Executa quando o reset é um ou quando a entrada é maior ou igual a 10
			//Zerando todas as entradas
			d5 <= 0;
			d4 <= 0;
			d3 <= 0;
			d2 <= 0;
			d1 <= 0;
			Mostra_Errado <= 1;//Identifica que a execução está nessa condição
		end//fim da condição
		else if(ready) begin//Executa quando o reset é 0
			Mostra_Errado <= 0;//Identificando que a entrada está dentro das possibilidades (0 a 9)
			d5 <= (B & ~C) | (~A & ~C & D) | (~B & C);//display 5 com sua equacao
			d4 <= (B & ~C) | (~B & C) | (C & ~D);//display 4 com sua equacao
			d3 <= (B) | (C & D);//display 3 com sua equacao
			d2 <= (B) | (A & ~C & ~D);//display 2 com sua equacao
			d1 <= (A) | (B & D) | (B & C);//display 1 com sua equacao
		end//fim da condição
	end//fim bloco always
endmodule//fim modulo