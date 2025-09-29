
select * from productSeller;

select count(*) from clients;
-- pedidos feitos pelos clientes
select * from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, " ",Lname) as Complete_name, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;


select * from clients c, orders 
	where c.idClient = idOrderClient;
    group by order;
    
select * from clients left join orders ON idClient = idOrderClient;

select * from clients c inner join orders o ON c.idClient = o.idOrderClient
			inner join productOrder p on p.idPOorder = o.idOrder;
            
-- Verificando o cliente, seu reespectivo produto o status de entrega e a quantidade reespectiva.
select * from clients;
select * from orders;
select * from products;
select 
    concat(c.Fname, " ", c.Lname) as Client,
    o.orderStatus,
    p.Pname as Product,
    po.poQuantity
from clients c
inner join orders o on c.idClient = o.idOrderClient
inner join productOrder po on o.idOrder = po.idPOorder
inner join products p on po.idPOproduct = p.idProduct;

select * from productOrder;
select * from supplier;
select * from seller;
select * from productSeller;
select 
    p.Pname as Produto, 
    s.SocialName as Vendedor,
    ps.prodQuantity as Quantidade
from productSeller ps
inner join products p on ps.idProduct = p.idProduct
inner join seller s on ps.idPseller = s.idSeller;

select * from productstorage;
select quantity from productStorage where quantity >= 100;

select 
    c.idClient,
    concat(c.Fname, ' ', c.Lname) as Cliente,
    count(o.idOrder) as TotalPedidos
from clients c
join orders o on c.idClient = o.idOrderClient
group by c.idClient, c.Fname, c.Lname
having TotalPedidos > 0
order by TotalPedidos desc;
