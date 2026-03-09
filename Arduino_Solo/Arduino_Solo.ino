const int ValorAr = 550;
const int ValorAgua = 230;

int valorUmidadeSolo = 0;
float porcentagemUmidade = 0;

const int maximo = 75;
const int minimo = 65; // const é um valor que nunca muda por isso estaremos usando para a porcentagem precisa

void setup(){
  Serial.begin(9600);
}

void loop() {

  valorUmidadeSolo = analogRead(A1);

  int faixa = ValorAr - ValorAgua;
  int distancia = ValorAr - valorUmidadeSolo;

  porcentagemUmidade = (float)distancia / faixa * 100.0;

  if (porcentagemUmidade < 0) porcentagemUmidade = 0;
  if (porcentagemUmidade > 100) porcentagemUmidade = 100;

  Serial.print("Bruto:");            // Nome que vai aparecer no gráfico
  Serial.print(valorUmidadeSolo);     // Valor BRUTO da umidade
  Serial.print(" | ");                // espaço para separar este do próximo print
  
  Serial.print("Porcentagem:");      // Nome que aparece no gráfico
  Serial.print(porcentagemUmidade);   // Valor da umidade calculado em PORCENTAGEM a partir do valor bruto
  Serial.print(" | ");              

  Serial.print("Minimo:");           // Nome do valor "minimo" que aparecerá no gráfico
  Serial.print(minimo);               // valor minimo: 65
  Serial.print(" | ");

  Serial.print("Maximo:");           // Nome do valor "máximo" que aparecerá no gráfico
  Serial.println(maximo);             // Envia o valor máximo: 75 e quebra linha
  
  /*
  O Serial.print "escreve" oq o gráfico vai receber, como se fosse uma mensagem
  O Serial.printLN "envia" essa mensagem para o plotter criando um gráfico automático com as medições que foram capturadas durante o tempo delay de 1 segundo
  
  O print ("nome:") dá um nome para um valor do gráfico (quaisquer numero q for inserido logo após no script)
  
  siga a ordem:
  Serial.print("nome: ")
  Serial.print(valor)
  
  lembrando q o valor deve ser uma variável q seja número, a string serve apenas para nomear os numeros do gráfico.
  */

  delay(1000);
}