USE loja;

-- Atualizar dados do produto com idProduto=1
UPDATE produto SET nome = 'Caneta', preco_de_venda = 3.50, quantidade = 10 WHERE idProduto = 1;

-- Inserir novos produtos
INSERT INTO produto (nome, preco_de_venda, quantidade) VALUES ('Caderno', 4.00, 05);
INSERT INTO produto (nome, preco_de_venda, quantidade) VALUES ('Lapis de colorir', 6.50, 08);

-- Inserir novo endereço para Marcos
DECLARE @ID_ENDERECO_MARCOS INT
SET @ID_ENDERECO_MARCOS = NEXT VALUE FOR idPessoa_SEQ
UPDATE pessoa SET logradouro = 'Av. Brasil, 525, Iguaçu', cidade = 'Ipatinga', estado = 'MG', telefone = '9999-8888',
email = 'marcos@hotmail.com' WHERE idPessoa = @ID;
INSERT INTO endereco (idPessoa, logradouro, cidade, estado, telefone, email) VALUES (@ID, 'Av. Brasil, 1654, Iguaçu', 'Ipatinga', 'MG', 
'9999-8888', 'marcos@hotmail.com');

-- Inserir novo endereço para Kamilla
DECLARE @ID_ENDERECO_KAMILLA INT
SET @ID_ENDERECO_KAMILLA = NEXT VALUE FOR idPessoa_SEQ
UPDATE pessoa SET logradouro = 'Rua Japão, 45, Cariru', cidade = 'Ipatinga', estado = 'MG', telefone = '8888-7777', 
email = 'kamilla@gmail.com' WHERE idPessoa = @ID2;
INSERT INTO endereco (idPessoa, logradouro, cidade, estado, telefone, email) VALUES (@ID2, 'Av Castelo Branco, Horto', 'Ipatinga', 'MG', 
'8888-7777', 'kamilla@gmail.com');
