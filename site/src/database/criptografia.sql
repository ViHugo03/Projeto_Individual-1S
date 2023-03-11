create database transacao;
use transacao;
create table usuario(
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45)
);

insert into usuario values
(null,'Celia Taniwaki','celia.taniwaka@sptech.school','senhaSecreta'),
(null,'Vivian Silva','vivan.silva@sptech.school','senhaQueNinguemSabe');

set @@autocommit = 0;

start transaction;
delete from usuario where idUsuario > 0;
rollback;
select * from usuario;
commit;



select aes_encrypt('senhaSecreta', 'chaveSecreta');


alter table usuario modify senha varbinary(150);

insert into usuario values
(null,'Paulo','paulo.souzaa@sptech.school',aes_encrypt('minhaSenha','chave'));

select aes_decrypt(senha,'chave') from usuario;


select * from usuario where email = 'paulo.souzaa@sptech.school' and senha = aes_encrypt('minhaSenha', 'chave');