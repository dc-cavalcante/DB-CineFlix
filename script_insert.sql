USE cineflix;

-- -----------------------------------------------------
-- 4. INSERÇÃO DE DADOS (INSERTS)
-- -----------------------------------------------------

INSERT INTO PLANO (Nome_Plano, Valor_Mensal) VALUES 
('Básico com Anúncios', 19.90),
('Padrão HD', 39.90),
('Premium 4K', 59.90);

INSERT INTO GENERO (Nome_Genero) VALUES 
('Ação'), ('Comédia'), ('Ficção Científica'), ('Drama'), ('Terror');

INSERT INTO TITULO (Titulo, Sinopse, Ano_Lancamento, Duracao_Total, Classificacao) VALUES 
('O Predador de Marte', 'Astronautas lutam em Marte.', 2024, 120, '+14'),
('Aventura na Cidade', 'Um cachorro perdido em SP.', 2023, 95, 'Livre'),
('O Lago Secreto', 'Mistérios em um acampamento.', 2022, 110, '+16');

INSERT INTO ASSINANTE (Nome, Email, Senha, Status_Pagamento, ID_Plano) VALUES 
('João Silva', 'joao@email.com', '123', 'Ativo', 3),
('Maria Souza', 'maria@email.com', 'abc', 'Ativo', 1),
('Carlos Lima', 'carlos@email.com', 'xyz', 'Pendente', 2);

INSERT INTO PERFIL (Apelido, Faixa_Etaria, ID_Assinante) VALUES 
('João Pai', 'Adulto', 1),
('Joãozinho', 'Kids', 1),
('Maria', 'Adulto', 2);

INSERT INTO TITULO_GENERO (ID_Titulo, ID_Genero) VALUES 
(1, 1), (1, 3), (2, 2), (3, 4), (3, 5);

INSERT INTO HISTORICO_VISUALIZACAO (Data_Hora, Ponto_Parada, Tempo_Assistido, ID_Perfil, ID_Titulo) VALUES 
('2025-11-20 20:00:00', 120, 120, 1, 1),
('2025-11-21 15:30:00', 15, 15, 2, 2);