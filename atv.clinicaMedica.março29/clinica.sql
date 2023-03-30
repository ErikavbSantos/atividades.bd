create database clinica;
use clinica;

drop database clinica;

create table Ambulatorios (
nroa int primary key,
andar numeric(3) not null,
capacidade smallint);

create table Medicos (
codm int primary key,
nome varchar(40) not null,
idade smallint not null,
especialidade char(20),
CPF numeric(11) unique,
cidade varchar(30),
fk_nroa int,
foreign key (fk_nroa) references Ambulatorios(nroa));

create table Pacientes (
codp int primary key,
nome varchar(40) not null,
idade smallint not null,
cidade char(30),
CPF numeric(11) unique,
doenca varchar(40) not null);

create table Funcionarios (
codf int primary key,
nome varchar(30) not null,
idade smallint,
CPF numeric(11) unique,
cidade varchar(30),
salario numeric(10),
cargo varchar(20));

create table Consultas (
fk_codm int,
foreign key (fk_codm) references Medicos(codm),
fk_codp int,
foreign key (fk_codp) references Pacientes(codp),
datas date, -- data estava dando erro então mudei para datas
hora time, 
primary key (fk_codm, hora, datas));

alter table Funcionarios add nroa int;

alter table Medicos add index idx_cpf (cpf);
alter table Pacientes add index idx_doenca (doenca);

alter table Pacientes drop index idx_doenca;

alter table Funcionarios drop column cargo;
alter table Funcionarios drop column nroa;

insert into Ambulatorios (nroa, andar, capacidade)
	values(1,1,30),
			(2,1,30),
			(3,1,30),
			(4,2,40),
			(5,2,55);
        
insert into Medicos (codm,nome, idade, especialidade, CPF, cidade, fk_nroa)
	values (1, "Joao", 40, "ortopedia", 10000100000, "Florianopolis", 1),
			(2, "Maria", 42, "traumatologia", 10000110000, "Blumenau", 2),
            (3, "Pedro", 51, "pediatria", 11000100000, "São José", 2),
            (4, "Carlos", 28, "ortopedia", 11000110000, "Joinvile", null),
            (5, "Marcia", 33, "neurologia", 11000111000, "Biguacu", 3);

insert into Pacientes (codp, nome, idade, cidade, CPF, doenca)
	values (1, "Ana", 20, "Florianopolis", 20000200000, "gripe"),
			(2, "Paulo", 24, "Palhoca", 20000220000, "fratura"),
            (3, "Lucia", 30, "Biguacu", 22000200000, "tendinite"),
            (4, "Carlos", 28, "Joiinville", 11000110000, "sarampo");

insert into Funcionarios (codf, nome, idade, cidade, salario, CPF)
	values (1, "Rita", 32, "São Jorge", 1200, 20000100000),
			(2, "Maria", 55, "Palhoca", 1220, 30000110000),
            (3, "Caio", 45, "Florianopolis", 1100, 41000100000),
            (4, "Carlos", 44, "Florianopolis", 1200, 51000110000),
            (5, "Paula", 33, "Florianopolis", 2500, 61000111000);

insert into Consultas (fk_codm, fk_codp, datas, hora)
	values (1, 1, "2006-06-12", "14:00"),
			(1, 4, "2006-06-13", "10:00"),
            (2, 1, "2006-06-13", "9:00"),
            (2, 2, "2006-06-13", "11:00"),
            (2, 3, "2006-06-14", "14:00"),
            (2, 4, "2006-06-14", "17:00"),
            (3, 1, "2006-06-19", "18:00"),
            (3, 3, "2006-06-12", "10:00"),
            (3, 4, "2006-06-19", "13:00"),
            (4, 4, "2006-06-20", "13:00"),
            (4, 4, "2006-06-22", "19:30");

update Pacientes set cidade = "Ilhota" where codp =  "2"; -- tem q puxar where da primary key

update Consultas set hora = "12:00" where fk_codm = "1" and fk_codp = "4";
update Consultas set datas = "2006-06-04" where fk_codm = "1" and fk_codp = "4";

update Pacientes set idade = "20" where codp = "1";
update Pacientes set doenca = "cancer" where codp = "1";

update Consultas set hora = "14:30" where fk_codm = "3" and fk_codp = "4";

delete from Funcionarios where codf = "4";

select * from Consultas where hora between "19:00" and "24:00"; -- para ver quais consultas se encaixavam na questão e facilitar na hora do delete
delete from Consultas where fk_codm = "4" and fk_codp = "4"; -- unica consulta que se encaixava

select * from Pacientes where doenca = "cancer"; -- para ver quais pacientes se encaixavam na questão e facilitar na hora do delete
select * from Pacientes where idade between "0" and "10"; -- para ver quais pacientes se encaixavam na questão e facilitar na hora do delete
select * from Consultas where fk_codp = "1"; -- agora que já sei qual é a paciente que se encaixa, preciso deletar as consultas dela para poder deletá-la da tabela pacientes
delete from Consultas where fk_codp = "1";
delete from Pacientes where codp = "1";

select * from Medicos where cidade = "Biguacu"; -- para ver quais medicos se encaixavam na questão e facilitar na hora do delete
select * from Medicos where cidade = "Palhoca"; -- para ver quais medicos se encaixavam na questão e facilitar na hora do delete
delete from Medicos where codm = "5"; -- unico medico que se encaixava