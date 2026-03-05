create database AgroSense;
use AgroSense;

-- ----- Criação das tabelas -----

create table cadastro(
id int primary key auto_increment,
nome_da_empresa Varchar(50)not null,
data_cadastro date not null,
sts_plano Varchar (30), constraint chkStatus check(sts_plano in('Ativo', 'Teste', 'Cancelado')),
aceite_dos_termos tinyint (1) not null
) ;

create table Informcao_do_cliente (
id int primary key auto_increment,
nome_da_empresa Varchar (50) not null,
telefone varchar(20) not null,
email Varchar(50) not null,
cidade_e_estado varchar (70) not null
);

create table informcao_da_plantação (
id int primary key auto_increment,
nome_da_empresa varchar(50) not null,
area_de_plantacao_hectares int not null,
producao_média_hectares int not null,
gasto_mensal_agua int not null
);

create table dados_do_sensor (
id int primary key auto_increment,
nome_da_empresa Varchar (50) not null,
data_horario_medicao datetime not null,
porcentagem_umidade float (5,2) not null
);

-- Script de inserção de dados

insert into cadastro(nome_da_empresa, data_cadastro,sts_plano, Aceite_dos_termos) values ('AgroSense', '2026-03-03', 'Ativo', 1);


-- ----- Script de Query -----
select *, case
when aceite_dos_termos = 1 then 'Aceitou'
else 'Não aceitou'
end as termos_de_uso
from cadastro;

Select porcentagem_umidade, case
when porcentagem_umidade <65 THEN 'ALERTA DE SOLO SECO'
When porcentagem_umidade >75 THEN 'ALERTA DE EXCESSO DE ÁGUA'
end as status_umidade
FROM dados_do_sensor;
