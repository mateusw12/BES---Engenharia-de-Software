select clienteCPF from Clientes 
order by clienteCPf desc
--Mateus Walz
--1 

 
INSERT [Clientes] ( [ClienteCPF], [ClienteNome], [ClienteSobrenome],
 [ClienteSexo], [ClienteNascimento], [ClienteEstadoCivil], [ClienteRua], [ClienteNumero], 
 [ClienteBairro], [ClienteCEP], [ClienteCidade], 
[ClienteEstado], [ClientePais], [ClienteRendaAnual], [ClienteTelefone], 
[ClienteEmail]) VALUES ('9999999', N'Mateus', N'Walz', N'M', 
CAST(N'1999-12-17 00:00:00.000' AS DateTime), N'S', N'Canario Belga', 105, N'Ilha da Figueira',
 N'89258809', N'Jaragua do sul', N'Santa Catarina', N'BRASIL', 0, N'9988226082', 
 N'jhuan120@gmail.com');


--2 
Update clientes set clienteRendaAnual = 10000 where clientecodigo = 1001
select clienteRendaAnual from Clientes
where Clientecodigo = 1001

select ClienteNome from clientes where clienteNome= 'Mateus'
--3

SELECT ClienteNome,
       ClienteSobrenome,
       ClienteRendaAnual,
       CASE
           WHEN ClienteRendaAnual < 90000 THEN
               'C'
           WHEN ClienteRendaAnual > 1500000 THEN
               'A'
           ELSE
               'B'
       END AS 'CLASSIFICAÇÃO'
    FROM Clientes
	order by clienteRendaAnual desc

--4 
	SELECT
           Clientes.ClienteBairro,
           CASE
               WHEN ClienteBairro IN ( 'Escolinha', 'Floresta', 'Anita Garibaldi' ) THEN
                   'Sul'
         
               WHEN ClienteBairro IN ( 'Bom Retiro', 'America', 'Jardim Iririu', 
			   'Jardim Paraiso', 'Jardim Sofia' ) THEN
                   'Norte'

				else 
					'Outros'

           END AS 'REGIÃO'
		
    FROM Clientes
	order by clienteBairro desc
​

