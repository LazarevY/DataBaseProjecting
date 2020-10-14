select * from (select model_id, price from car_sharing_schema.model_price where price < 2000) as t1
    NATURAL JOIN car_sharing_schema.autos_models m1
    WHERE m1.brand_id in (select brand_id from car_sharing_schema.autos_brands where brand_name = 'Kia');


select model_name, price, registration_number, quality, mileage from car_sharing_schema.autos a1 NATURAL JOIN
    (select * from (select model_id, price from car_sharing_schema.model_price where price < 2000) as t1
    NATURAL JOIN car_sharing_schema.autos_models m1
    WHERE m1.brand_id in (select brand_id from car_sharing_schema.autos_brands where brand_name = 'Lada')) as t1
where a1.status_id = 0 and a1.auto_id in (select auto_id from car_sharing_schema.auto_in_office o1 where departure_date is null
    and o1.office_id in (select office_id from car_sharing_schema.branch_offices where office_address =
                                                                                   'Voronezh, Solnechnaya, 105'));

