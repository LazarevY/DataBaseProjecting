create table ratings(
    rating_id SERIAL      primary key not null,
    rating    varchar(20) unique  not null
);

create table rent_statuses(
    status_id SERIAL        primary key not null,
    status_name    varchar(40)   unique      not null
);

create table status_of_auto(
    status_id   INTEGER     primary key not null DEFAULT 0,
    status_name varchar(40) unique      not null
);

create table drive_categories(
    category_id SERIAL primary key not null,
    category_name    varchar(10) unique not null
);

create table autos_brands(
    brand_id    SERIAL      primary key not null,
    brand_name  varchar(10) unique      not null
);

create table branch_offices(
    office_id       SERIAL primary key  not null,
    office_name     varchar(20)         not null,
    office_address  varchar(200)        not null
);

create table autos_models(
    model_id    SERIAL      primary key not null,
    model_name  varchar(60)             not null,
    brand_id    INTEGER                 not null,
    category_id INTEGER                 not null,
    CONSTRAINT brand_id_fk
             FOREIGN KEY (brand_id)
                REFERENCES autos_brands (brand_id) ON DELETE CASCADE,

    CONSTRAINT category_id_fk
             FOREIGN KEY (category_id)
                 REFERENCES drive_categories (category_id) ON DELETE CASCADE
);

create table model_price (
    model_id INTEGER primary key not null,
    price NUMERIC not null DEFAULT 0,
    CONSTRAINT model_id_fk
             FOREIGN KEY (model_id)
                REFERENCES autos_models (model_id)
);

create table autos(
    auto_id SERIAL primary key not null,
    status_id INTEGER not null,
    model_id INTEGER not null,
    registration_number varchar(20) not null unique,
    mileage INTEGER not null,
    quality INTEGER not null,
    CONSTRAINT model_id_fk
              FOREIGN KEY (model_id)
                    REFERENCES autos_models (model_id) ON DELETE CASCADE,
    CONSTRAINT status_id_fk
              FOREIGN KEY  (status_id)
                    REFERENCES status_of_auto (status_id) ON DELETE SET NULL,
    CONSTRAINT quality_range
              CHECK ( quality >= 0 and quality <= 50),
    CONSTRAINT mileage_nonnegative
              CHECK ( mileage >= 0 )


);

create table auto_in_office(
    note_id         SERIAL primary key  not null,
    auto_id         INTEGER             not null,
    office_id       INTEGER             not null,
    receipt_date    timestamp                not null,
    departure_date  timestamp                default NULL,
    CONSTRAINT auto_id_fk
                FOREIGN KEY (auto_id)
                   REFERENCES autos (auto_id) ON DELETE CASCADE
);

create table car_sharing_schema.clients(
    client_id               SERIAL      primary key not null,
    client_name             varchar(90)             not null,
    client_second_name      varchar(90)             not null,
    client_father_name      varchar(90)             default null,
    client_passport         varchar(200)            not null unique,
    client_drive_license    varchar(200)            not null unique

);

create table clients_categories(
    note_id SERIAL primary key not null,
    client_id INTEGER not null,
    category_id INTEGER not null,
    CONSTRAINT client_id_fk
               FOREIGN KEY (client_id)
                   REFERENCES clients(client_id) ON DELETE CASCADE,
    CONSTRAINT category_id_fk
               FOREIGN KEY  (category_id)
                   REFERENCES drive_categories (category_id) ON DELETE CASCADE
);

create table rent_contracts(
    contract_id     SERIAL  primary key not null,
    client_id       INTEGER             not null,
    auto_id         INTEGER             not null,
    rent_begin_date timestamp                not null,
    rent_end_date   timestamp                not null,
    rent_price      NUMERIC             not null CHECK ( rent_price > 0 ),
    actual_income   NUMERIC             not null DEFAULT 0,
    CONSTRAINT client_id_fk
               FOREIGN KEY (client_id)
                   REFERENCES clients (client_id) ON DELETE CASCADE,
    CONSTRAINT auto_id_fk
               FOREIGN KEY (auto_id)
                   REFERENCES autos (auto_id) ON DELETE CASCADE,
    CONSTRAINT valid_dates
               CHECK ( rent_begin_date < rent_end_date )
);

create table clients_rating(
    note_id     SERIAL  primary key not null,
    client_id   INTEGER             not null,
    raring_id   INTEGER,
    CONSTRAINT client_id_fk
                FOREIGN KEY (client_id)
                   REFERENCES clients (client_id) ON DELETE CASCADE,
    CONSTRAINT  rating_id_fk
                FOREIGN KEY (raring_id)
                   REFERENCES ratings (rating_id) ON DELETE SET NULL
);

create table rents_history(
    note_id SERIAL primary key not null,
    contract_id INTEGER not null,
    status_id INTEGER not null,
    note varchar(200) not null,
    note_date timestamp not null,
    CONSTRAINT contract_id_fk
                FOREIGN KEY (contract_id)
                    REFERENCES rent_contracts (contract_id) ON DELETE CASCADE,
    CONSTRAINT status_id_fk
                FOREIGN KEY (status_id)
                    REFERENCES rent_statuses (status_id) ON DELETE CASCADE
);


