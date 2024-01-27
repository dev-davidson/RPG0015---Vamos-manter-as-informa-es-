USE loja;

-- dados de pf
SELECT * FROM pessoa
INNER JOIN pessoa_fisica ON pessoa.idPessoa = pessoa_fisica.idPessoa;

-- dados de pj
SELECT * FROM pessoa
INNER JOIN pessoa_juridica ON pessoa.idPessoa = pessoa_juridica.idPessoa;

-- movimentos de entrada (tipo 'E')
SELECT *, quantidade * valor_unitario as valor_total FROM movimento WHERE tipo = 'E';

-- movimentos de saída (tipo 'S')
SELECT *, quantidade * valor_unitario as valor_total FROM movimento WHERE tipo = 'S';

-- valor total de entrada (produto)
SELECT idProduto, SUM(quantidade * valor_unitario) as valor_total FROM movimento WHERE tipo = 'E' GROUP BY idProduto;

-- valor total de saída (produto)
SELECT idProduto, SUM(quantidade * valor_unitario) as valor_total FROM movimento WHERE tipo = 'S' GROUP BY idProduto;

-- idUsuario de movimentos
SELECT idUsuario FROM movimento WHERE tipo = 'S'
EXCEPT
SELECT idUsuario FROM movimento WHERE tipo = 'E';

-- valor total de entrada (usuário)
SELECT idUsuario, SUM(quantidade * valor_unitario) as valor_total FROM movimento WHERE tipo = 'E' GROUP BY idUsuario;

-- valor total de saída (usuário)
SELECT idUsuario, SUM(quantidade * valor_unitario) as valor_total FROM movimento WHERE tipo = 'S' GROUP BY idUsuario;

-- valor médio de saída (produto)
SELECT idProduto, AVG(valor_unitario) as valor_medio FROM movimento WHERE tipo = 'S' GROUP BY idProduto;