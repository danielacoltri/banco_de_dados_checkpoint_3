CREATE DATABASE DB_CONDOMINIO;
USE DB_CONDOMINIO;

CREATE TABLE status_morador (
    id_status_morador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status_morador VARCHAR(45) NOT NULL
);

CREATE TABLE morador (
    id_morador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(155) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    data_cadastro DATE,
    id_status_morador INT NOT NULL,
    CONSTRAINT fk_status_morador_morador FOREIGN KEY (id_status_morador)
        REFERENCES status_morador (id_status_morador)
);
    
CREATE TABLE status_apartamento (
    id_status_apartamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status_apartamento VARCHAR(45) NOT NULL
);

CREATE TABLE bloco_apartamento (
    id_bloco INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    bloco VARCHAR(2) NOT NULL
);

CREATE TABLE apartamento (
    id_apartamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_bloco INT NOT NULL,
    numero INT NOT NULL,
    andar INT NOT NULL,
    id_status INT NOT NULL,
    CONSTRAINT fk_bloco_apartamento FOREIGN KEY (id_bloco)
        REFERENCES bloco_apartamento (id_bloco),
    CONSTRAINT fk_apartamento_status_apartamento FOREIGN KEY (id_status)
        REFERENCES status_apartamento (id_status_apartamento)
);

CREATE TABLE visitas (
    id_visita INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_visita VARCHAR(155) NOT NULL,
    rg VARCHAR(9) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    id_apartamento INT NOT NULL,
    data_entrada DATETIME,
    data_saida DATETIME,
    autorizado TINYINT(1) NOT NULL,
    CONSTRAINT fk_visitas_apartamento FOREIGN KEY (id_apartamento)
        REFERENCES apartamento (id_apartamento)
);

CREATE TABLE estacionamento (
    id_vaga INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_apartamento INT NOT NULL,
    CONSTRAINT fk_estacionamento_apartamento FOREIGN KEY (id_apartamento)
        REFERENCES apartamento (id_apartamento)
);

CREATE TABLE veiculos (
    id_veiculo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    placa VARCHAR(7) NOT NULL,
    id_vaga INT NOT NULL,
    CONSTRAINT fk_veiculos_estacionamento FOREIGN KEY (id_vaga)
        REFERENCES estacionamento (id_vaga)
);

CREATE TABLE pagamento_condominio (
    id_pagamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_apartamento INT NOT NULL,
    data_vencimento DATE,
    data_envio DATETIME,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_condominio_apartamento FOREIGN KEY (id_apartamento)
        REFERENCES apartamento (id_apartamento)
);
    
CREATE TABLE morador_apartamento (
    id_morador_apartamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_morador INT NOT NULL,
    id_apartamento INT NOT NULL,
    CONSTRAINT fk_morador_apartamento_morador FOREIGN KEY (id_morador)
        REFERENCES morador (id_morador),
    CONSTRAINT fk_morador_apartamento_apartamento FOREIGN KEY (id_apartamento)
        REFERENCES apartamento (id_apartamento)
);

CREATE TABLE area_comum (
    id_area_comum INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    espaco VARCHAR(100) NOT NULL
);

CREATE TABLE status_reserva (
    id_status_reserva INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status_reserva VARCHAR(100) NOT NULL
);

CREATE TABLE reserva_espaco (
    id_reserva INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_apartamento INT NOT NULL,
    data_pedido DATETIME,
    id_status_reserva INT,
    data_inicio_reserva DATETIME,
    data_fim_reserva DATETIME,
    id_area_comum INT,
    CONSTRAINT fk_reserva_espaco_apartamento FOREIGN KEY (id_apartamento)
        REFERENCES apartamento (id_apartamento),
    CONSTRAINT fk_reserva_espaco_status_reserva FOREIGN KEY (id_status_reserva)
        REFERENCES status_reserva (id_status_reserva),
    CONSTRAINT fk_reserva_espaco_area_comum FOREIGN KEY (id_area_comum)
        REFERENCES area_comum (id_area_comum)
);

CREATE TABLE correios (
	id_correio INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_apartamento int,
    id_morador int,
    data_recebimento datetime,
    data_retirada datetime,
    CONSTRAINT fk_correios_apartamento FOREIGN KEY (id_apartamento)
        REFERENCES apartamento (id_apartamento),
	CONSTRAINT fk_correios_morador FOREIGN KEY (id_morador)
        REFERENCES morador (id_morador)
);

ALTER TABLE morador
ADD rg VARCHAR(9);

ALTER TABLE morador
ADD cpf VARCHAR(11);