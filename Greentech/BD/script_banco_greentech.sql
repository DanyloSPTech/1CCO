create database Greentech;
use Greentech;

-- TABELA 1 EMPRESAS --

create table Gestor 
	(
	idGestor int primary key auto_increment,
	nome varchar (45),
	numero char (11),
	email varchar (45),
    login varchar (20),
	senha varchar (45)
	);

-- INSERÇÃO DE DADOS TABELA 2 --
insert into Gestor Values 
	(null, 'Roberto Rofrigues', '1198746712', 'roberto@rodriguez.sptech.com','OlimpusGreenTech99', 'Elisium'),
	(null, 'Karina Elena', '1194637871', 'karina@elena.sptech.com','BrasilGreenTech77', 'AgroTomate');

create table Empresas 	
	(
	idEmpresa int primary key auto_increment,
	nomeEmpresa varchar (100),
	CNPJ char (14),
	fkGestor int,
	foreign key (fkGestor) references Gestor(idGestor)
	);

-- INSERÇÃO DE DADOS TABELA 1 --
insert into Empresas Values 
	(null, 'Tomates Olimpus', '12841292000174', 1),
	(null, 'Brasil Tomates', '40091179000154', 2);

-- TABELA 2 --

-- TABELA 3 --
create table Estufas 
	(
	idEstufa int primary key auto_increment,
	fkEmpresa int,
    foreign key (fkEmpresa) references Empresas(idEmpresa),
	nomeEstufa varchar (45),
    tamanho varchar (45),
    tipo varchar (45)
	);

-- INSERÇÃO DE DADOS TABELA 3 --
insert into Estufas Values 
	(null, 1, 'Persefone','3 hectares','tomate cereja'),
	(null, 1, 'Apolo','5 hectares','tomate japonês'),
	(null, 2, 'Estufa-1A','6 hectares','tomate verdadeiro'),
	(null, 2, 'Estufa-2A','4 hectares','tomate vermelho real');

-- TABELA 4 --
create table Monitoramento 
	(
	idMonitoramento int primary key auto_increment,
	temperatura decimal (5,2),
	umidade decimal (5,2),
	hora time,
	dataMonitoramento date,
	fkEstufa int,
    foreign key (fkEstufa) references Estufas(idEstufa),
    luminosidade int
	);

-- INSERÇÃO DE DADOS TABELA 4 --
insert into Monitoramento Values 
	(null, 18.00, 60.00, '18:30:00', '2021-12-01', '1' ,300),
	(null, 19.00, 70.00, '18:35:00', '2021-12-01', '1' ,400),
	(null, 21.00, 80.00, '18:40:00', '2021-12-01', '1' ,700),
	(null, 25.00, 67.00, '06:40:00', '2021-12-05', '2' ,400),
	(null, 12.00, 85.00, '06:45:00', '2021-12-05', '2' ,500),
	(null, 30.00, 50.00, '06:50:00', '2021-12-05', '2' ,800);

create table Controle 
	(
	idControle int primary key auto_increment,
	fkEstufa int,
    foreign key  (fkEstufa) references Estufas(idEstufa), 
    maxTemp decimal (5,2),
	minTemp decimal (5,2),
    maxUmidade decimal (5,2),
	minUmidade decimal (5,2),
    maxLuminosidade int,
    minLuminosidade int
	);

-- INSERÇÃO DE DADOS TABELA 4 --
insert into Controle Values 
	(null, 2, 25.00, 20.00, 85.00, 72.00,700,300),
	(null, 1, 24.00, 19.50, 84.00, 73.00,400,200),
	(null, 3, 24.50, 19.50, 85.00, 75.00,800,300);
create table Alerta (
idAlerta int primary key auto_increment,
tipoAlerta varchar (45),
fkMonitoramento int,
foreign key (fkMonitoramento) references Monitoramento(idMonitoramento),
fkControle int,
foreign key (fkControle) references Controle(idControle)
);

insert into Alerta values (null,'baixa temperatura',1,1);
insert into Alerta values (null,'alta temperatura',2,2);
-- SELECTS --
-- MOSTRAR MONITORAMENTO APENAS DE ESTUFAS ESPECIFICAS --
select * from monitoramento where fkEstufa like 1;

-- MOSTRAR APENAS ESTUFAS DE EMPRESAS ESPECIFICAS --
select * from Estufas where fkEmpresa like 2;

-- MOSTRAR APENAS O MONITORAMENTO DE ESTUFAS QUE PASSARAM DE ALGUM PARAMETRO --
select * from monitoramento where temperatura > 20;
select * from monitoramento where umidade > 50;

-- MOSTRAR APENAS O MONITORAMENTO DE ESTUFAS DE EMPRESAS ESEPECÍFICAS QUE PASSARAM DE ALGUM PARAMETRO --
select * from monitoramento where fkEstufa like 1 and temperatura > 20;
select * from monitoramento where fkEstufa like 2 and umidade > 70;

-- MOSTRAR APENAS EMPRESAS COM NOMES ESPECÍFICOS --
select * from empresas where nomeEmpresa like 't%';
