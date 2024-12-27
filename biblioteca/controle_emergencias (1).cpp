/**************************************************
*
* Nomes: João Pedro Martins Montera, Lucas Rocha Liz
* Trabalho 1
* Professor(a): Fábio Henrique Viduani Martinez
*
*/



#include <iostream>
#include <cstdlib>
#include <cstring>
#include <limits>     

//===============================================(Definição da célula paciente da lista encadeada)==============================================================

struct Paciente {
    int id_paciente;
    char nome[51];                  
    char enfermidade[51];
    bool ocupado;                   //indica se a posição está ocupada

    Paciente() : ocupado(false) {} //construtor padrão         
};

//=======================================================(Definição da tabela de dispersão)=========================================================================

class TabelaDispersao {
private:
    static const int TAMANHO = 23;
    Paciente tabela[TAMANHO];  //criação de um vetor de ponteiros para

    //função hash para gerar o id com base na tabela ASC
    int funcao_hash(char* nome) {
        int soma = 0;
        for (int i = 0; nome[i] != '\0'; i++) {
            soma += nome[i];
        }
        return soma % TAMANHO;
    }

public:
    //função de inserção
    void inserirPaciente(int novo_id, char* nome, char* enfermidade) {
        int indice = funcao_hash(nome);
        while (tabela[indice].ocupado) {
            indice = (indice + 1) % TAMANHO;
        }
        tabela[indice].id_paciente = novo_id;
        strcpy(tabela[indice].nome, nome);
        strcpy(tabela[indice].enfermidade, enfermidade);
        tabela[indice].ocupado = true;
    }

    //função de busca pelo nome
    Paciente* BuscaPaciente(int id_buscado) {
        for (int i = 0; i < TAMANHO; i++) {
            if (tabela[i].ocupado && tabela[i].id_paciente == id_buscado) {
                return &tabela[i];
            }
        }
        return nullptr;
    }
};

//==========================================================(Definição da chamada de emergência)==========================================================================

struct Chamada {
    int id_paciente;
    int gravidade;
};

//===============================================================(Definição do Max Heap)==================================================================================

class Heap {
private:
    Chamada* S;
    int capacidade;
    int tamanho;

    int pai(int i) { return (i - 1) / 2; }
    int esquerdo(int i) { return 2 * i + 1; }
    int direito(int i) { return 2 * i + 2; }
    void troca(int i, int j) {
        Chamada aux = S[i];
        S[i] = S[j];
        S[j] = aux;
    }

    //metodo para descer caso a prioridade seja menor
    void desce(int i) {
        int e = esquerdo(i), d = direito(i), maior = i;
        if (e < tamanho && S[e].gravidade > S[maior].gravidade) maior = e;
        if (d < tamanho && S[d].gravidade > S[maior].gravidade) maior = d;
        if (maior != i) {
            troca(i, maior);
            desce(maior);
        }
    }

    //metodo para subir caso a prioridade seja maior
    void sobe(int i) {
        while (i > 0 && S[pai(i)].gravidade < S[i].gravidade) {
            troca(i, pai(i));
            i = pai(i);
        }
    }

public:
    Heap(int capacidade) : capacidade(capacidade), tamanho(0) {
        S = new Chamada[capacidade];
    }

    ~Heap() { delete[] S; }

    //metodo para inserção
    void insere(Chamada c) {
        if (tamanho == capacidade) {
            std::cout << "Heap cheio\n";
            return;
        }
        S[tamanho] = c;
        sobe(tamanho);
        tamanho++;
    }

    //metodo para extração do máximo
    Chamada extrai_maxima() {
        if (tamanho <= 0) return { -1, -1 };
        Chamada raiz = S[0];
        S[0] = S[tamanho - 1];
        tamanho--;
        desce(0);
        return raiz;
    }

    bool vazio() {
        return tamanho == 0;
    }

    // Função para escrever os níveis do heap
    void escreve_niveis() {
        int escritos = 0, fim_nivel = 1;

        for (int i = 0; i < tamanho; i++) {
            printf("%d ", S[i].id_paciente);  // Mudança para mostrar o ID do paciente
            if (++escritos == fim_nivel) {
                putchar('\n');
                fim_nivel *= 2;
                escritos = 0;
            }
        }
        putchar('\n');
    }

    // Função para escrever a estrutura do heap
    void escreve(const std::string& prefixo, int i) {
        if (i < tamanho) {
            bool ehEsquerdo = i % 2 != 0;
            bool temIrmao = i < tamanho - 1;

            printf("%s", prefixo.c_str());
            printf(ehEsquerdo && temIrmao ? "├──" : "└──");

            printf("%d\n", S[i].id_paciente);  // Mudança para mostrar o ID do paciente

            escreve(prefixo + (ehEsquerdo ? "│   " : "    "), esquerdo(i));
            escreve(prefixo + (ehEsquerdo ? "│   " : "    "), direito(i));
        }
    }

    void imprimeEmOrdem(TabelaDispersao& tabela_pacientes) {
        // Faz uma cópia do heap atual para não alterar a estrutura original
        Heap copia(capacidade);
        for (int i = 0; i < tamanho; i++) {
            copia.insere(S[i]);
        }

        // Extrai o máximo repetidamente e imprime os nomes em ordem
        while (!copia.vazio()) {
            Chamada maxima = copia.extrai_maxima();
            Paciente* paciente = tabela_pacientes.BuscaPaciente(maxima.id_paciente); // Usa a função de busca da tabela
            if (paciente != nullptr) {
                std::cout << paciente->nome << " (Gravidade: " << maxima.gravidade << ")\n";
            }
        }
    }
};

//========================================================================(main)=================================================================================================

int main() {
    int n;
    std::cout << "Digite a quantidade de pacientes a serem adicionados\n";
    std::cin >> n;
    std::cin.ignore();

    TabelaDispersao tabela_pacientes;           //criação da tabela de dispersão para guardar todos os pacientes
    Heap ListaDePrioridades(n);                 //ciração da lista de prioridades em formato de max heap passando a quantidade de nós

    std::cout << "Agora digite o nome e a enfermidade de cada paciente\n";
    // loop para adicionar os pacientes à tabela de dispersão
    for (int i = 0; i < n; i++) {
        char nome[51], enfermidade[51];
        std::cout << "Paciente " << i + 1 << ":\n";
        std::cout << "Nome e enfermidade: ";
        std::cin.getline(nome, 51, ','); // lê o nome até a vírgula
        std::cin.getline(enfermidade, 51); // lê a enfermidade até o final da linha
        int id = i; // uso o índice como id do paciente
        tabela_pacientes.inserirPaciente(id, nome, enfermidade);
    }

    std::cout << "-------------------------------------------Tabela de pacientes-------------------------------------------\n";
    for (int i = 0; i < n; i++) {
        Paciente* paciente = tabela_pacientes.BuscaPaciente(i); // Busca o paciente pelo ID
        if (paciente != nullptr) { // Verifique se o paciente foi encontrado
            std::cout << "ID: " << paciente->id_paciente 
                    << ", Nome: " << paciente->nome 
                    << ", Enfermidade: " << paciente->enfermidade << std::endl;
        }
    }
    std::cout << "---------------------------------------------------------------------------------------------------------\n";

    std::cout << "Agora digite o id do paciente e sua urgência\n";
    //após registrar os pacientes na tabela de dispersão adicionamos a prioridade de cada um no max heap
    for (int i = 0; i < n; i++) {
        int id, urgencia;
        std::cin >> id >> urgencia;  //essa linha lê dois valores separados por um espaço e guarda nas variáveis id e urgencia
        ListaDePrioridades.insere({ id, urgencia });
    }


    // Exibindo os níveis do heap
    std::cout << "----------------------------------------------Estrutura do Heap (níveis)---------------------------------\n";
    ListaDePrioridades.escreve_niveis();

    // Exibindo a estrutura do heap
    std::cout << "----------------------------------------------Estrutura do Heap------------------------------------------\n";
    ListaDePrioridades.escreve("", 0);

    std::cout << "------------------------------------------Lista de Pacientes por Ordem de Gravidade----------------------\n";
    ListaDePrioridades.imprimeEmOrdem(tabela_pacientes);

    return 0;
}
