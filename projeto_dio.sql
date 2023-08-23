create database ecommerce;
use ecommerce

create table clients(
	idClient int auto_increment primary key,
	Fname varchar(10),
	Minit char(3),
	Lname varchar(20),
	CPF char(11) not null,
	Address  varchar(30),
	constraint unique_cpf_client unique (CPF)
);

desc client;

create tale product(
	idProduct int auto_increment primary key,
	Pname varchar(10) not null,
	classification_kids bool default false,
	category enum ('Devices', 'clothes', 'toys','food') not null,
	Address varchar(30),
	evaluation float default 0,
	size varchar(10),
	constraint unique_cpf_client unique (CPF)
);

create table payments(
	idClient int,
	idPayment int,
	typePayment enum('paypal', 'credit', 'debit'),
	limitAvailable float,
	primary key(idClient, idPayment)

);


create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int,
	orderStatus enum('canceled','confirmed','processing') default 'processing',
	orderDescription varchar(255),
	sendValue float default 10,
	paymentCash bool default false,
	idPaymentOrder int,
	constraint fk_payment_client foreign key (idPaymentOrder) references payments(idPayment),
	constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);

create table productStorage(
	idProdStorage int auto_increment primary key,
	storageLocation varchar(255),
	quantity int default 0

);

create table supplier(
	idSupplier int auto_increment primary key,
	socialName varchar(255) not null,
	CNPJ char(35) not null,
	contact char(11) not null,
	constraint unique_supplier unique (CNPJ)
);

desc supplier;

creeate table seller(
	idSeller int auto_increment primary key,
	socialName varchar(255) not null,
	fantasyName varchar(255),
	CNPJ char(15),
	CPF char(11),
	location varchar(255),
	contact char(11) not null,
	constraint unique_cnpj_seller unique (CNPJ),
	constraint unique_cpf_seller unique (CPF)	
);

create table productSeller(
	idSeller int,
	idProduct int,
	prodQuality int default 1,
	primary key (idPseller, idProduct),
	constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
	constraint fk_product_product foreign key (idProduct) references product(idProduct)

);


create table productOrder(
	idPOproduct int,
	idPOorder int,
	poQuantify int defalt 1,
	poStatus enum('available','in stock') default 'available',
	primary key (idProduct, idPOorder),
	constraint fk_productOrder_seller foreign key (idPOproduct) references product(idProduct),
	constraint fk_productOrder_product fireign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
	idLproduct int,
	idLstorage int,
	location varchar(255) not null,
	primary key (idLproduct, idLstorage),
	constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
	constraint fk_storage_location_storage foreign key (idLstorage) references orders(idProdStorage)
);

create table productSupplier(
	idPsupplier int,
	idPsProduct int,
	quantity int not null,
	primary key (idPsSupplier, idPsProduct),
	constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

desc productSupplier;

show tables;

show databases;
--#####################################
--Consultas:

insert into Clients (Fname, Minit, Lname, CPF, Address)
    VALUES('Helena', 'M', 'Claudia', '12312312398', 'rua silva paulet, 3073 - fortaleza ce');

insert into product(Pname, classification_kids, category, available, size) VALUES
                    ('Fone de ouvido', false,'Device', '4', null);

insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) VALUES
                        (1, default, 'compra via aplicativo', null, 1);

select * from orders;

insert into productOrder (idPOproduct, idPOorder, poQuantify, poStatus) VALUES
                        (1,1,2,null);

insert into productStorage (storageLocation, quantity) VALUES
                            ('Rio de JAneiro', 1000);

insert into supplier (socialName, CNPJ, contact) VALUES
                    ('Almeida e filho',123879123897128937, '12308912312');

insert into productSupplier(idPsSupplier, idPsProduct, quantity) VALUES
                            (1,1,500);

insert into seller (socialName, fantasyName, CNPJ, location, contact) VALUES
                ('Tech Electronics', null, 12831290831290, null, 'Rio de janeiro', 12893891238);

insert into productSeller(idPseller, idPproduct, prodQuality) VALUES
                    (1,6,80);


select * from productSeller;

select  * from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

select count(*) from clients c, orders o where c.idClient = idOrderClient group by idOrder;

select * from clients c inner join orders o ON c.idClient = o.idOrderClient inner join productOrder p on p.idPOorder = o.idOrder;