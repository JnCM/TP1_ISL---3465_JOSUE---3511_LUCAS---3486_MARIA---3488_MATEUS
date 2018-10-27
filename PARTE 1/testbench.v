`include "Numero.v"//incluíndo o modulo com as equações a serem usadas
module testbench();//modulo da simulacao
	reg A, B, C, D, reset, ready;//definindo as entradas como registradores para guardar os valores
	wire d1, d2, d3, d4, d5;//definindo as saídas como fios para passarem os valores
	Numero moduloNumero (.A(A), .B(B), .C(C), .D(D), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .reset(reset), .ready(ready));//instanciando o módulo das equações
	initial begin//começo do bloco initial
		$dumpfile("Numero.vcd");//criando o arquivo vcd para gerar a forma de onda
		$dumpvars(0, testbench);//definindo todas as variaveis como 0
		$display("Conversao para codigo morse:");//exibindo na tela
		$monitor("%b%b%b%b = %b%b%b%b%b", A, B, C, D, d5, d4, d3, d2, d1);//acompanhando cada mudança nas variaveis e exibindo na tela
	end//fim do bloco initial
	initial begin//começo do bloco initial
			reset = 1;//usando o reset para começar a simulação
		#1; reset = 0;//indicando que já pode colocar valores
		//as linhas seguintes definem a tabela da verdade e as alterações no ready indicando que já pode fazer a conversão quando o mesmo for 1
		#1; ready = 0; A = 0; B = 0; C = 0; D = 0; ready = 1;
		#1; ready = 0; A = 0; B = 0; C = 0; D = 1; ready = 1;
		#1; ready = 0; A = 0; B = 0; C = 1; D = 0; ready = 1;
		#1; ready = 0; A = 0; B = 0; C = 1; D = 1; ready = 1;
		#1; ready = 0; A = 0; B = 1; C = 0; D = 0; ready = 1;
		#1; ready = 0; A = 0; B = 1; C = 0; D = 1; ready = 1;
		#1; ready = 0; A = 0; B = 1; C = 1; D = 0; ready = 1;
		#1; ready = 0; A = 0; B = 1; C = 1; D = 1; ready = 1;
		#1; ready = 0; A = 1; B = 0; C = 0; D = 0; ready = 1;
		#1; ready = 0; A = 1; B = 0; C = 0; D = 1; ready = 1;
		#1;//fim da simulação
		$finish;//fim das operações do primeiro bloco initial
	end//fim do bloco initial
endmodule//fim do modulo