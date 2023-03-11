CREATE DATABASE keyboard;

USE keyboard;

create table curso (
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
	nomeCurso VARCHAR(200)
);

CREATE TABLE aluno (
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	cpf CHAR(11) unique,
	email VARCHAR(50),
	senha VARCHAR(50),
     fkCurso int,
    foreign key(fkCurso) references curso(idCurso)
)auto_increment = 100;

create table aula(
idAula int primary key auto_increment,
nomeAula varchar(40),
fkCurso int,
foreign key(fkCurso) references curso(idCurso)
);

create table AulaAluno(
fkAluno int,
fkAula int,
foreign key(fkAluno) references aluno(idAluno),
foreign key(fkAula) references aula(idAula),
primary key(fkAluno,fkAula),
notaAluno int
);

insert into curso values
               (null,'Teclado');
               
insert into aula values
               (null,'Introdução',1),
               (null,'Noções Básicas',1),
               (null,'Escalas',1);
               
select *from curso;

select *from aluno;

select * from aula;

select fkAluno, notaAluno from AulaAluno WHERE fkAluno = idAluno;
select notaAluno from AulaAluno join aluno on fkAluno = idAluno; 