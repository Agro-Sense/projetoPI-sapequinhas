/*
GRUPO 06 - 1SIS
HENRIQUE REZENDE - 03261008
JONAS FERNANDES - 03261024
LUCAS GALVAO - 03261018
LUIZ SOBRINHO - 03261015
MARCUS VINICIUS - 03261056
MATHEUS ANJOS - 03261062
*/

create database AgroSense;
use AgroSense;

-- ----- Criação das tabelas -----

create table cadastro(
id int primary key auto_increment,
nome_da_empresa Varchar(50)not null,
data_cadastro date default (current_date),
sts_plano Varchar (30), constraint chkStatus check(sts_plano in('Ativo', 'Inativo')),
telefone varchar(20) not null
);

create table informacao_do_cliente (
id int primary key auto_increment,
nome_da_empresa Varchar (50) not null,
cnpj Varchar (20),
telefone varchar(20) not null,
email Varchar(50) not null,
cidade varchar (70) not null,
estado char (2)
);

create table informacao_da_plantacao (
id int primary key auto_increment,
nome_da_empresa varchar(50) not null,
area_de_plantacao_hectares int not null,
producao_media_hectares int not null
);

CREATE TABLE qntd_de_sensores(
id int primary key auto_increment,
nome_da_empresa varchar(50) not null,
qntd_de_sensores int not null
);

create table dados_dos_sensores (
id int primary key auto_increment,
nome_da_empresa varchar(50) not null,
ident_do_sensor int not null,
data_horario_medicao datetime default current_timestamp(),
porcentagem_umidade decimal (5,2) constraint chk_porcentagem check(porcentagem_umidade between 0 and 100) 
);

-- inserindo dados
insert into cadastro values
(default, 'JBS','2026-01-02','Ativo','1190028922'),
(default, 'Raízen','2025-06-14','Ativo','1198987676'),
(default, 'Agromania','2025-03-30','Inativo','1192987059'),
(default, 'Sítio Oliveira','2026-02-08','Ativo','1198388831'),
(default, 'Ferreira´s Agro','2026-01-11','Ativo','1198886611');

insert into informacao_do_cliente values
(default,'JBS', '33445468910023','1190028922','jbs@gmail.com','Guarulhos','SP'),
(default,'Raízen','12332144557682','1198987676','raizen@gmail.com','Parati','RJ'),
(default,'Agromania','88779909028145','1192987059','agromania@gmail.com','São Bernardo','SP'),
(default,'Sítio Oliveira','14357869942132','1198388831','st.oliveira@gmail.com','Araraquara','SP'),
(default,'Ferreira´s Agro','66745321987008','1198886611','ferreira.agro@gmail.com','São Carlos','RJ');

insert into informacao_da_plantacao values
(default,'JBS',5,7500),
(default,'Raízen',10,15000),
(default,'Agromania',4,6800),
(default,'Sítio Oliveira',3,5000),
(default,'Ferreira´s Agro',8,10000);

Insert into qntd_de_sensores values
(default,'JBS', 5),
(default,'Raízen', 10),
(default,'Agromania',4),
(default,'Sítio Oliveira',3),
(default,'Ferreira´s Agro',8);

insert into dados_dos_sensores values
(default,'JBS',1,default,54.01),
(default,'JBS',2,default,65.00),
(default,'JBS',3,default,77.00),
(default,'JBS',4,default, null),
(default,'JBS',5,default,63.00);


-- ----- Script de Query ------
select * from cadastro;
select * from informacao_do_cliente;
select * from informacao_da_plantacao;
select * from qntd_de_sensores;

Select *, case
When porcentagem_umidade is null THEN 'ALERTA SENSOR COM DEFEITO'
when porcentagem_umidade <65 THEN 'ALERTA DE SOLO SECO'
When porcentagem_umidade >75 THEN 'ALERTA DE EXCESSO DE ÁGUA'
else 'UMIDADE ESTÁ NO NÍVEL CORRETO'
end as status_umidade
FROM dados_dos_sensores;



