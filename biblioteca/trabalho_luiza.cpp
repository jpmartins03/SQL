/**************************************************
*
* Luiza Helena Barboza
* Trabalho 1
* Professor(a): Fábio Henrique Viduani Martinez
*
*/

#include <iostream>
#include <limits>
#include <cstring>
#include <cstdlib>


struct Paciente {
    int id;
    bool ativo;
    char nome[51];
    char enfermidade[51];
    
    Paciente() : ativo(false) {}
};

struct ChamadaEmergencia {
    int idPaciente;
    int prioridade;
};

class TabelaHash {
private:
    static const int TAM = 23;
    Paciente pacientes[TAM];

    int calcularHash(char* nome) {
        int soma = 0;
        for (int i = 0; nome[i] != '\0'; i++) {
            soma += nome[i];
        }
        
        return soma % TAM;
    }

public:
    void adicionarPaciente(int id, char* nome, char* enfermidade) {
        int indice = calcularHash(nome);
        while (pacientes[indice].ativo) {
            indice = (indice + 1) % TAM;
        }
       

        pacientes[indice].id = id;
        strcpy(pacientes[indice].nome, nome);
        strcpy(pacientes[indice].enfermidade, enfermidade);
        pacientes[indice].ativo = true;
    }

    Paciente* buscarPaciente(int id) {
        for (int i = 0; i < TAM; i++) {
            if (pacientes[i].ativo && pacientes[i].id == id) {
                return &pacientes[i];
            }
        }

        return nullptr;
    }
};

class FilaPrioridade {
private:
    ChamadaEmergencia* heap;
    int capacidade;
    int qtd;

    int pai(int i) { return (i - 1) / 2; }
    int esquerdo(int i) { return 2 * i + 1; }
    int direito(int i) { return 2 * i + 2; }

    void subir(int i) {
        while (i > 0 && heap[pai(i)].prioridade < heap[i].prioridade) {
            trocar(i, pai(i));
            i = pai(i);
        }
    }

    void trocar(int i, int j) {
        ChamadaEmergencia aux = heap[i];
        heap[i] = heap[j];
        heap[j] = aux;
    }

    void descer(int i) {
        int esq = esquerdo(i), dir = direito(i), maior = i;
        if (esq < qtd && heap[esq].prioridade > heap[maior].prioridade) maior = esq;
        if (dir < qtd && heap[dir].prioridade > heap[maior].prioridade) maior = dir;
        if (maior != i) {
            trocar(i, maior);
            descer(maior);
        }
    }


public:
    FilaPrioridade(int capacidade) : capacidade(capacidade), qtd(0) {
        heap = new ChamadaEmergencia[capacidade];
    }

    ~FilaPrioridade() { delete[] heap; }

    void inserir(ChamadaEmergencia c) {
        if (qtd == capacidade) {
            std::cout << "Fila cheia\n";
            return;
        }
        heap[qtd] = c;
        
        subir(qtd);
        qtd++;
    }

    ChamadaEmergencia extrairMax() {
        if (qtd <= 0) return { -1, -1 };
        ChamadaEmergencia raiz = heap[0];
        heap[0] = heap[qtd - 1];
        qtd--;
       
        descer(0);
        return raiz;
    }

    bool estaVazia() {
        return qtd == 0;
    }

    void imprimirPorPrioridade(TabelaHash& tabelaPacientes) {
        
        FilaPrioridade copia(capacidade);
        
        for (int i = 0; i < qtd; i++) {
            copia.inserir(heap[i]);
        }

        while (!copia.estaVazia()) {
           
            ChamadaEmergencia max = copia.extrairMax();
            Paciente* paciente = tabelaPacientes.buscarPaciente(max.idPaciente);
            if (paciente != nullptr) {
                std::cout << paciente->nome << " (Prioridade: " << max.prioridade << ")\n";
            }
        }
    }
};

int main() {
    int n;
    std::cout << "Quantos pacientes serao atendidos?:\n";
    std::cin >> n;
    std::cin.ignore();

    TabelaHash tabelaPacientes;
    FilaPrioridade fila(n);

    for (int i = 0; i < n; i++) {
       
        char nome[51], enfermidade[51];
        std::cout << "Paciente " << i + 1 << " - Nome e Enfermidade:\n";
        std::cin.getline(nome, 51, ',');
        std::cin.getline(enfermidade, 51);
        tabelaPacientes.adicionarPaciente(i, nome, enfermidade);
    }

    std::cout << "Qual o id do paciente e sua urgencia? (0-10):\n";
    for (int i = 0; i < n; i++) {
       
        int id, urgencia;
        std::cin >> id >> urgencia;
        fila.inserir({ id, urgencia });
    }

    std::cout << "Ordenacao dos pacientes por prioridade:\n";
    fila.imprimirPorPrioridade(tabelaPacientes);

    return 0;
}
