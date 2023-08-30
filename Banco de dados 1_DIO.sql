-- criação de banco de dados para o cenario de e-commerce --

-- create database ecommerce; 

SELECT * FROM cliente;

SELECT * FROM fornecedor;

SELECT * FROM vendedor;

-- Usando a cláusula WHERE--

SELECT primeironome, ultimonome, datanascimento, cidade
FROM cliente
WHERE sexo = 'M';

SELECT primeironome, ultimonome, datanascimento, cidade
FROM cliente
WHERE sexo = 'M';

-- Criando expressões para gerar atributos derivados --

SELECT primeironome, ultimonome, (year(CURDATE()) - year(datanascimento)) as idade
FROM cliente;

SELECT primeironome, ultimonome, (year(CURDATE()) - year(datanascimento)) as idade
FROM cliente;
WHERE sexo = 'M';

SELECT primeironome, ultimonome, (year(CURDATE()) - year(datanascimento)) as idade
FROM cliente;
WHERE sex = 'F';

SELECT sexo, avg((year(CURDATE()) - year(datanascimento))) as avg_idade
FROM cliente
GROUP BY sexo;

SELECT (year(CURDATE()) - year(datanascimento)) AS idade, count(1)
FROM cliente
GROUP BY idade;

-- Encomendar com ORDER BY --

SELECT primeironome, ultimonome, (year(CURDATE()) - year(datanascimento)) as idade
FROM cliente
ORDER BY firstname;

SELECT primeironome, ultimonome, (year(CURDATE()) - year(datanascimento)) as idade
FROM cliente
ORDER BY idade;

SELECT (year(CURDATE()) - year(datanascimento)) AS idade, count(1) AS Qtd
FROM cliente
GROUP BY idade
ORDER BY Qtd desc;

SELECT sexo, count(1) AS Qtd
FROM cliente
GROUP BY sexo
ORDER BY Qtd desc;

-- Agrupando e usando HAVING --

SELECT (year(CURDATE()) - year(datanascimento)) AS idade, count(1) AS Qtd
FROM cliente
GROUP BY idade 
HAVING qtd > 1;

-----------------
-- Usando JOIN
-----------------

-- Seleção de preços e de fornecedores --

SELECT s.registeredname, p.categoria, p.price
FROM Fornecedor s JOIN ecommerce.`Disponibilidade de um produto` m
ON 
	s.idFornecedor = m.idFornecedor
JOIN produto p
ON
	m.idProduto = p.idProduto;

-- Seleção de fornecedores e preço medio de venda --
    
SELECT s.registeredname, p.categoria, ROUND(AVG(p.price),2) as avg_price
FROM fornecedor s JOIN ecommerce.`making a product available` m
ON 
	s.idFornecedor = m.idFornecedor
JOIN produto p
ON
	m.idProduto = p.idProduto
GROUP BY 
	s.registeredname;

-- Selecionando a compra de cada cliente e a(s) quantidade(s). --

SELECT p.primeironome, p.cidade, pr.categoria, pr.preço, pr.quantidade
FROM
	cliente p JOIN ecommerce.order o
ON
	p.idCliente = o.idCliente
JOIN
	productorder po
ON
	o.idOrder = po.idOrder
JOIN
	produto pr
ON
	po.idProduto = pr.idProduto;

-- Quantia que cada cliente gastou --

SELECT p.primeironome, round(sum(pr.preço),2) AS total, sum(pr.quantidade) as total_qtd
FROM
	cliente p JOIN ecommerce.order o
ON
	p.idCliente = o.idCliente
JOIN
	productorder po
ON
	o.idOrder = po.idOrder
JOIN
	product pr
ON
	po.idProduto = pr.idProduto
GROUP BY p.primeironome;