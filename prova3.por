programa
{
	inclua biblioteca Calendario-->dat
	inclua biblioteca Tipos-->tp
	inclua biblioteca Arquivos-->arq
	
	funcao inicio()
	{
	const cadeia caminhoFinal="C:/Users/Aluno/Desktop/prova/final.txt"
	const cadeia caminhoTabuada="C:/Users/Aluno/Desktop/prova/tabuada.txt"
	const cadeia caminhoTriangulo="C:/Users/Aluno/Desktop/prova/triangulo.txt"
	cadeia matz[4][2]
	inteiro num,num2,arquivo=0
	real nota
	infoMatz(matz)
	escreva("Informe um número para a tabuada:\n->")
	leia(num)
	limpa()
	enquanto(num<=0){
		escreva("Número inválido, informe um número maior que 0\n")
		escreva("Informe um número para a tabuada:\n->")
		leia(num)
		limpa()
	}
	tabuada(num,caminhoTabuada,arquivo)
	escreva("\nInforme um número para formar o padrão triangular:\n->")
	leia(num2)
	limpa()
	enquanto(num2<=0){
		escreva("Número inválido, informe um número maior que 0\n")
		escreva("Informe um número para formar o padrão triangular:\n->")
		leia(num2)
		limpa()
	}
	triangulo(num,caminhoTriangulo,arquivo)
	escreva("\nInforme a nota do aluno:\n->")
	leia(nota)
	limpa()
	enquanto(nota<=0){
		escreva("Qual e professor me da uma nota melhor!\n")
		escreva("Informe uma nota melhor:\n->")
		leia(nota)
		limpa()
	}
	
	salvarArquivo(matz,arquivo,nota,caminhoFinal,caminhoTabuada,caminhoTriangulo,num2)
	}//<---FIM DA FUNÇÃO INICIO
	funcao vazio infoMatz(cadeia &matz[][]){
		cadeia dia,mes,ano,texto
		dia=tp.inteiro_para_cadeia(dat.dia_mes_atual(),10)
		mes=tp.inteiro_para_cadeia(dat.mes_atual(),10)
		ano=tp.inteiro_para_cadeia(dat.ano_atual(),10)
		matz[0][0]="Aluno:"
		matz[1][0]="Professor:"
		matz[2][0]="Disciplina:"
		matz[3][0]="Nota:"
		//-----
		matz[0][1]="Davi Fontinele "+dia+"/"+mes+"/"+ano
		matz[1][1]="Lucas Paixão Gois"
		matz[2][1]="Lógica de Programação:"
	}
	funcao vazio tabuada (inteiro num,cadeia caminhoTabuada,inteiro arquivo){
		cadeia textoLinha=" "
		arquivo=arq.abrir_arquivo(caminhoTabuada,arq.MODO_ESCRITA)
		para(inteiro l=0;l<11;l++){
			escreva(num,"x",l,"=",num*l,"\n")
			textoLinha=tp.inteiro_para_cadeia(num,10)+"x"+tp.inteiro_para_cadeia(l,10)+"="+tp.inteiro_para_cadeia(num*l,10)
			arq.escrever_linha(textoLinha,arquivo)
		}
		arq.fechar_arquivo(arquivo)
	}
	funcao vazio triangulo(inteiro num2,cadeia caminhoTriangulo,inteiro arquivo){
		cadeia textoLinha
		arquivo=arq.abrir_arquivo(caminhoTriangulo,arq.MODO_ESCRITA)
		para(inteiro i=0;i<=num2;i++){
			para(inteiro l=1;l<=i;l++){
			escreva(l)
			textoLinha=tp.inteiro_para_cadeia(l,10)
			arq.escrever_linha(textoLinha,arquivo)
			}
			escreva("\n")
		}
		arq.fechar_arquivo(arquivo)
	}
	funcao vazio salvarArquivo(cadeia matz[][],inteiro arquivo,real nota,cadeia caminhoFinal,cadeia caminhoTabuada,cadeia caminhoTriangulo,inteiro num2){
		cadeia textoLinha
		inteiro arquivoFinal,arquivoTabuada,arquivoTriangulo
		matz[3][1]=tp.real_para_cadeia(nota)
		arquivo=arq.abrir_arquivo(caminhoFinal,arq.MODO_ESCRITA)
		para(inteiro l=0;l<4;l++){
			textoLinha=matz[l][0]+matz[l][1]
			arq.escrever_linha(textoLinha,arquivo)
		}
		textoLinha="----------------------------------------"
		arq.escrever_linha(textoLinha,arquivo)
		arq.fechar_arquivo(arquivo)
		//-----
		arquivoTabuada=arq.abrir_arquivo(caminhoTabuada,arq.MODO_LEITURA)
		arquivoFinal=arq.abrir_arquivo(caminhoFinal,arq.MODO_ACRESCENTAR)
		para(inteiro l=0;l<11;l++){
			textoLinha=arq.ler_linha(arquivoTabuada)
			arq.escrever_linha(textoLinha,arquivoFinal)
		}
		textoLinha="----------------------------------------"
		arq.escrever_linha(textoLinha,arquivoFinal)
		arq.fechar_arquivo(arquivoFinal)
		arq.fechar_arquivo(arquivoTabuada)
		//-----
		arquivoTriangulo=arq.abrir_arquivo(caminhoTriangulo,arq.MODO_LEITURA)
		arquivoFinal=arq.abrir_arquivo(caminhoFinal,arq.MODO_ACRESCENTAR)
		para(inteiro l=0;l<num2;l++){
			textoLinha=arq.ler_linha(arquivoTriangulo)
			arq.escrever_linha(textoLinha,arquivoFinal)
		}
		arq.fechar_arquivo(arquivoFinal)
		arq.fechar_arquivo(arquivoTriangulo)
	}
}