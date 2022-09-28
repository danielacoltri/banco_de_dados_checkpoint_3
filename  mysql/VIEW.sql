use DB_CONDOMINIO;

create view ins_veiculo as
select id_apartamento, id_veiculo, modelo, placa
from estacionamento
inner join veiculos
on veiculos.id_veiculo = estacionamento.id_apartamento;

create view morador_dados as 
select id_morador, nome, telefone, email,
case
	when id_status_morador = 1 then "Ativos" end as status
from morador;

-- select * from morador_dados;
-- select * from ins_veiculo;
