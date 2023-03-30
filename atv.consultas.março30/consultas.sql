create database Consultas;
use Consultas;

drop database Consultas;

create table Funcionarios (
codigo int primary key,
primeiroNome varchar(20),
segundoNome varchar(20),
ultimoNome varchar(20),
dataNasci date,
CPF numeric(11),
RG numeric(9),
endereco varchar(40),
CEP numeric(9),
cidade varchar(40),
fone numeric(13),
codigoDepartamento int,
funcao varchar(20),
salario numeric(10,2));

insert into funcionarios (codigo, primeiroNome, SegundoNome, ultimoNome, dataNasci, CPF, RG, endereco, CEP, cidade, fone, codigoDepartamento, funcao, salario)
	values (1, "Ana", "Paula", "Cristina", "1991-02-05", 56127526019, 154785214, "Avenida dos Timbiras", 68902872, "Recife", 5581981712850, 1, "vendas", "850.50"),
			(2, "Hugo", "Thales", "Moura", "1947-01-02", 86588930062, 202870819, "Avenida José Cirino Rodrigues 191", 95315970, "São Lourenço da Mata", 5587995605932, 4, "gerencia", "2200.50"),
			(3, "Cauê", "","Lopes", "1955-02-24", 27804295006, 316376516, "Rua Maria Coêlho", 69307760, "Jaboatão dos Guararapes", 5581992476535, 4, "gerencia", "2200.50"),
			(4, "Beatriz", "Marlene", "Manuela", "1984-10-24", 18244601043, 509319300, "Rua Guilherme Pompeu de Almeida", 06530140, "Camaragibe", 5581926791524, 3, "contabilidade", "1750.10"),
			(5, "Patrícia", "Juliana", "Paula", "2004-01-13", 22929974010, 186919347, "Ladeira Doutor Geraldo Melo dos Santos", 57051240, "Recife", 5581927115299, 1, "vendas", "850.50"),
			(6, "Eduarda", "", "Gonçalves", "1994-03-17", 02031677080, 296552501, "Travessa Araguaina", 69315633, "Jaboatão dos Guararapes", 5581991957322, 2, "telefonista", "850.50"),
			(7, "Raul", "Nelson", "Galvão", "1978-01-24", 29774340035, 371292554, "Travessa Santa Lúcia", 69901282, "Olinda", 5581937552447, 5, "estoque", "850.50"),
            (8, "Jorge", "Sebastião", "Costa", "1959-01-04", 61345910096, 195914399, "Rua Aguapei", 30240240, "Recife", 5581987424102, 1, "vendas", "850.50"),
			(9, "Tiago", "Severino", "Cunha", "1974-01-25", 77210271015, 288262682, "Rua Pioneiro Caetano Penatti", 87025350, "Paulista", 5581927543708, 6, "caixa", "1200.10"),
			(10, "Gabriel", "Vitor", "Neves", "1960-03-02", 49779711082, 397001691, "Rua Aguiar de Lima", 86605000, "Olinda", 5581999120150, 5, "estoque", "850.50"),
			(11, "Anthony", "", "Monteiro", "1987-12-08", 64097611046, 456264425, "Rua Cláudio Manoel da Costa", 54715170, "Ituiutaba", 5581935592475, 2, "telefonista", "850.50"),
			(12, "Sophie", "Sarah", "Sales", "1986-01-11", 64693830097, 496005509, "1ª Travessa Frei Damião", 52165202, "Recife", 5581987369787, 6, "caixa", "1200.10");

select primeiroNome, segundoNome, ultimoNome from funcionarios order by ultimoNome;
select * from funcionarios order by cidade;
select * from funcionarios where salario > 1000.00 order by primeiroNome, segundoNome, ultimoNome;
select dataNasci, primeiroNome from funcionarios order by dataNasci desc;
select primeiroNome, ultimoNome from funcionarios where segundoNome = "";
select * from funcionarios where cidade = "Ituiutaba" and codigoDepartamento = 2;
select primeiroNome, segundoNome, ultimoNome from funcionarios where codigoDepartamento = 2;
select primeiroNome, ultimoNome, codigoDepartamento from funcionarios where salario > 2000.00;