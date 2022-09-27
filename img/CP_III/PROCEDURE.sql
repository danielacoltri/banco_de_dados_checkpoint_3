DELIMITER $$
CREATE PROCEDURE sp_ins_veiculo(IN sp_modelo varchar(45), IN sp_placa varchar(7), IN sp_id_vaga INT)
BEGIN
    INSERT INTO veiculos (modelo, placa, id_vaga) VALUES (sp_modelo, sp_placa, sp_id_vaga);
END $$
DELIMITER 

set @sp_modelo = 'Celta';
set @sp_placa = 'AJH2378';
set @sp_id_vaga = '1';

call sp_ins_veiculo (@sp_modelo, @sp_placa, @sp_id_vaga);

-- select * from veiculos;
 
