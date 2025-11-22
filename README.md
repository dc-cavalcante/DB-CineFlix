# CineFlix - Sistema de Gerenciamento de Banco de Dados para Streaming 🎬

![Status do Projeto](https://img.shields.io/badge/Status-Concluído-brightgreen) ![MySQL](https://img.shields.io/badge/Database-MySQL-blue) ![Normalização](https://img.shields.io/badge/Normalização-3FN-orange)

## 📋 Sobre o Projeto

O **CineFlix** é um projeto acadêmico focado na modelagem e implementação de um banco de dados relacional robusto para uma plataforma fictícia de streaming de vídeo.

O objetivo principal não é a transmissão do vídeo em si, mas ser a "espinha dorsal" que gerencia os metadados essenciais: catálogo de títulos, categorização complexa por gêneros, gestão de assinantes, múltiplos perfis de usuário e o rastreamento detalhado do histórico de visualização.

O projeto foi desenvolvido passando por todas as etapas de engenharia de dados: levantamento de requisitos (minimundo), modelagem conceitual (DER), modelagem lógica e implementação física (SQL).

---

## 🎯 Funcionalidades e Escopo

O banco de dados foi projetado para suportar as seguintes operações de negócio:

* **Gestão de Catálogo:** Cadastro de filmes e séries com detalhes técnicos (ano, duração, classificação).
* **Categorização Flexível:** Associação de um título a múltiplos gêneros (Relacionamento N:N).
* **Planos de Assinatura:** Definição de diferentes níveis de serviço e preços.
* **Gestão de Usuários:** Cadastro de assinantes e vinculação ao plano escolhido.
* **Múltiplos Perfis:** Permite que uma conta de assinante tenha vários perfis (ex: Kids, Adulto) para personalizar a experiência.
* **Histórico de Visualização Detalhado:** Rastreamento de "quem" assistiu "o quê", "quando", "quanto tempo" assistiu e o "ponto de parada" para a funcionalidade "Continuar Assistindo".

---

## 🛠️ Tecnologias Utilizadas

* **Banco de Dados:** MySQL Server 8.0
* **Ferramenta de Modelagem:** MySQL Workbench

---

## 🚀 Como Executar o Projeto

Este repositório contém um arquivo de "Dump" SQL completo, que inclui tanto a estrutura do banco (CREATE TABLE) quanto dados fictícios para teste (INSERT).

### Pré-requisitos

* Ter o MySQL Server e o MySQL Workbench instalados.

### Passo a Passo

1.  **Clone** este repositório ou baixe o arquivo `.sql` principal (ex: `cineflix_dump.sql`).
2.  Abra o **MySQL Workbench**.
3.  Conecte-se à sua instância local.
4.  Vá no menu **File > Open SQL Script...** e selecione o arquivo `.sql` que você baixou.
5.  O script completo aparecerá na tela. Clique no ícone de **Raio** (⚡) na barra de ferramentas para executar tudo.
6.  Após a execução, atualize o painel de "Schemas" à esquerda. O banco de dados `CineFlix` estará criado com todas as tabelas e dados.

---

## 🔎 Exemplos de Uso (Queries SQL)

Abaixo estão exemplos de consultas que o banco de dados é capaz de responder:

### Exemplo 1: O que cada perfil andou assistindo recentemente?
*Uma consulta complexa unindo 3 tabelas para gerar um relatório de histórico.*

```sql
SELECT 
    P.Apelido AS Perfil, 
    T.Titulo AS Filme, 
    H.Data_Hora AS Quando_Assistiu,
    H.Tempo_Assistido AS Minutos_Vistos
FROM HISTORICO_VISUALIZACAO H
JOIN PERFIL P ON H.ID_Perfil = P.ID_Perfil
JOIN TITULO T ON H.ID_Titulo = T.ID_Titulo
ORDER BY H.Data_Hora DESC
LIMIT 10;
