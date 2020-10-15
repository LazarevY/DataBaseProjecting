insert into rent_statuses (status_name)
values ('in_force');
insert into rent_statuses (status_name)
values ('violation');
insert into rent_statuses (status_name)
values ('canceled');
insert into rent_statuses (status_name)
values ('completed_successfully');

insert into drive_categories (category_name)
values ('B');
insert into drive_categories (category_name)
values ('D');

insert into ratings (rating)
values ('neutral');
insert into ratings (rating)
values ('below_average');
insert into ratings (rating)
values ('above_average');
insert into ratings (rating)
values ('high');
insert into ratings (rating)
values ('low');

insert into autos_brands (brand_name)
values ('Ford');
insert into autos_brands (brand_name)
values ('Kia');
insert into autos_brands (brand_name)
values ('Datsun');
insert into autos_brands (brand_name)
values ('Renaut');
insert into autos_brands (brand_name)
values ('Lada');
insert into autos_brands (brand_name)
values ('Volkswagen');
insert into autos_brands (brand_name)
values ('Opel');
insert into autos_brands (brand_name)
values ('Chevrolet');

insert into car_sharing_schema.status_of_auto (status_id, status_name)
values (0, 'available');
insert into car_sharing_schema.status_of_auto (status_id, status_name)
values (1, 'busy');
insert into car_sharing_schema.status_of_auto (status_id, status_name)
values (2, 'not_available');

insert into car_sharing_schema.autos_models (model_name, brand_id, category_id)
values ('Rio 2020 Standard',
        (select brand_id from car_sharing_schema.autos_brands where brand_name = 'Kia'),
        (select category_id from car_sharing_schema.drive_categories where category_name = 'B'));

insert into car_sharing_schema.autos_models (model_name, brand_id, category_id)
values ('Sandero 2020 Standard',
        (select brand_id from car_sharing_schema.autos_brands where brand_name = 'Renaut'),
        (select category_id from car_sharing_schema.drive_categories where category_name = 'B'));

insert into car_sharing_schema.autos_models (model_name, brand_id, category_id)
values ('Vesta 2020 Standard',
        (select brand_id from car_sharing_schema.autos_brands where brand_name = 'Lada'),
        (select category_id from car_sharing_schema.drive_categories where category_name = 'B'));

insert into car_sharing_schema.model_price (model_id, price)
values ((select model_id from car_sharing_schema.autos_models where model_name = 'Rio 2020 Standard'),
        800);

insert into car_sharing_schema.model_price (model_id, price)
values ((select model_id from car_sharing_schema.autos_models where model_name = 'Sandero 2020 Standard'),
        1000);

insert into car_sharing_schema.model_price (model_id, price)
values ((select model_id from car_sharing_schema.autos_models where model_name = 'Vesta 2020 Standard'),
        600);

insert into car_sharing_schema.branch_offices (office_name, office_address)
values ('Office0',
        'Voronezh, Solnechnaya, 105');

insert into car_sharing_schema.branch_offices (office_name, office_address)
values ('Office0',
        'Voronezh, Solnechnaya, 105');

insert into car_sharing_schema.branch_offices (office_name, office_address)
values ('Office0',
        'Voronezh, Sredne-Moscovskaya, 12');

insert into car_sharing_schema.autos (status_id, model_id, registration_number, mileage, quality)
values (0,
        (select model_id from car_sharing_schema.autos_models where model_name = 'Rio 2020 Standard'),
        'с065мк36RUS',
        2000,
        48);

insert into car_sharing_schema.autos (status_id, model_id, registration_number, mileage, quality)
values (0,
        (select model_id from car_sharing_schema.autos_models where model_name = 'Rio 2020 Standard'),
        'н465мк36RUS',
        2100,
        48);

insert into car_sharing_schema.autos (status_id, model_id, registration_number, mileage, quality)
values (0,
        (select model_id from car_sharing_schema.autos_models where model_name = 'Rio 2020 Standard'),
        'а527нк36RUS',
        1900,
        48);

insert into car_sharing_schema.autos (status_id, model_id, registration_number, mileage, quality)
values (0,
        (select model_id from car_sharing_schema.autos_models where model_name = 'Sandero 2020 Standard'),
        'с765мк36RUS',
        2000,
        48);

insert into car_sharing_schema.autos (status_id, model_id, registration_number, mileage, quality)
values (0,
        (select model_id from car_sharing_schema.autos_models where model_name = 'Vesta 2020 Standard'),
        'и225мк36RUS',
        2000,
        48);

insert into car_sharing_schema.autos (status_id, model_id, registration_number, mileage, quality)
values (0,
        (select model_id from car_sharing_schema.autos_models where model_name = 'Vesta 2020 Standard'),
        'е676уа36RUS',
        2000,
        48);

insert into car_sharing_schema.auto_in_office (auto_id, office_id, receipt_date)
values ((select auto_id from car_sharing_schema.autos where registration_number = 'е676уа36RUS'),
        0,
        TIMESTAMP '2020-10-12 11:00:00');

insert into car_sharing_schema.auto_in_office (auto_id, office_id, receipt_date)
values ((select auto_id from car_sharing_schema.autos where registration_number = 'и225мк36RUS'),
        0,
        TIMESTAMP '2020-10-12 11:00:00');

insert into car_sharing_schema.auto_in_office (auto_id, office_id, receipt_date)
values ((select auto_id from car_sharing_schema.autos where registration_number = 'с065мк36RUS'),
        1,
        TIMESTAMP '2020-10-12 11:00:00');

insert into car_sharing_schema.auto_in_office (auto_id, office_id, receipt_date)
values ((select auto_id from car_sharing_schema.autos where registration_number = 'н465мк36RUS'),
        1,
        TIMESTAMP '2020-10-12 11:00:00');

insert into car_sharing_schema.clients (client_name, client_second_name, client_passport, client_drive_license)
values ('Ivan', 'Ivanov', '4215656421', '3216987265');

insert into car_sharing_schema.clients_categories (client_id, category_id)
values ((select client_id from car_sharing_schema.clients where client_passport = '4215656421'),
        (select category_id from car_sharing_schema.drive_categories where category_name = 'B'));

insert into car_sharing_schema.clients_rating (client_id, raring_id)
values ((select client_id from car_sharing_schema.clients where client_passport = '4215656421'),
        (select rating_id from car_sharing_schema.ratings where rating = 'neutral'));

insert into car_sharing_schema.rent_contracts (client_id, auto_id, rent_begin_date, rent_end_date, rent_price)
values ((select client_id from car_sharing_schema.clients where client_passport = '4215656421'),
        (select auto_id from car_sharing_schema.autos where registration_number = 'и225мк36RUS'),
        timestamp '2020-10-15 10:00',
        timestamp '2020-10-18 10:00',
        9000);
