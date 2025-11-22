USE CineFlix;



-- 1. Atualizar o preço de um plano específico
-- O plano 'Premium 4K' (ID 3) vai aumentar para 65.90
UPDATE PLANO 
SET Valor_Mensal = 65.90 
WHERE ID_Plano = 3;

-- 2. Corrigir ou alterar o status de um assinante
-- O assinante 'Carlos Lima' pagou a conta, mudando de 'Pendente' para 'Ativo'
UPDATE ASSINANTE 
SET Status_Pagamento = 'Ativo' 
WHERE Email = 'carlos@email.com';

-- 3. Alterar dados de um filme
-- O filme 'O Predador de Marte' teve a duração corrigida para 130 minutos
UPDATE TITULO 
SET Duracao_Total = 130 
WHERE ID_Titulo = 1;


-- EXCLUSÕES (DELETE) - Apagar dados


-- 1. Apagar um registro específico do histórico
-- Vamos apagar o registro de histórico número 1
DELETE FROM HISTORICO_VISUALIZACAO 
WHERE ID_Historico = 1;

-- 2. Remover uma associação de gênero
-- Vamos tirar o gênero 'Comédia' (ID 2) do filme 'Aventura na Cidade' (ID 2)
DELETE FROM TITULO_GENERO 
WHERE ID_Titulo = 2 AND ID_Genero = 2;

-- 3. Apagar um perfil
-- Vamos apagar o perfil do 'Joãozinho' (ID 2)
-- Obs: Só funciona se ele não tiver histórico de visualização (ou se apagarmos o histórico antes, como fizemos no item 1 acima).
DELETE FROM PERFIL 
WHERE ID_Perfil = 2;