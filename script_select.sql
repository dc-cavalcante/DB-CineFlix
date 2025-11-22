USE CineFlix;


-- Objetivo: Mostrar todos os filmes com classificação '+14' ou maior, ordenados pelo ano de lançamento (do mais novo para o mais velho).
SELECT Titulo, Ano_Lancamento, Classificacao 
FROM TITULO 
WHERE Classificacao <> 'Livre' 
ORDER BY Ano_Lancamento DESC;


-- Objetivo: Mostrar o nome do Assinante e qual Plano ele contratou.
SELECT 
    A.Nome AS Nome_Assinante, 
    P.Nome_Plano, 
    P.Valor_Mensal
FROM ASSINANTE A
INNER JOIN PLANO P ON A.ID_Plano = P.ID_Plano;


-- Objetivo: Mostrar o Histórico de Visualização: Quem assistiu, O que assistiu e Quando. (Limitado aos 5 últimos registros).
SELECT 
    P.Apelido AS Perfil, 
    T.Titulo AS Filme, 
    H.Data_Hora
FROM HISTORICO_VISUALIZACAO H
JOIN PERFIL P ON H.ID_Perfil = P.ID_Perfil
JOIN TITULO T ON H.ID_Titulo = T.ID_Titulo
ORDER BY H.Data_Hora DESC
LIMIT 5;

-- Objetivo: Contar quantos filmes existem por Classificação Indicativa.
SELECT Classificacao, COUNT(*) as Total_Filmes
FROM TITULO
GROUP BY Classificacao;