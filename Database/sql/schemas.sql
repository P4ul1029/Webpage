CREATE SCHEMA IF NOT EXISTS AirBnB_Group_40;
CREATE SCHEMA IF NOT EXISTS data_source;

GRANT USAGE ON SCHEMA AirBnB_Group_40 TO amerc084;
GRANT USAGE ON SCHEMA AirBnB_Group_40 TO jbass084;
GRANT USAGE ON SCHEMA AirBnB_Group_40 TO pbara036;

CREATE TABLE IF NOT EXISTS data_source.calendar_data (
    id  SERIAL,
    listing_id      INT,
    date    TIMESTAMP,
    available   BOOLEAN,
    price   TEXT,
    PRIMARY KEY(id)
);

GRANT ALL ON TABLE data_source.calendar_data TO amerc084;
GRANT ALL ON TABLE data_source.calendar_data TO jbass084;
GRANT ALL ON TABLE data_source.calendar_data TO pbara036;

CREATE TABLE IF NOT EXISTS data_source.listings_data (
    id  INT,
    listing_url TEXT,
    scrape_id   FLOAT,
    last_scraped    TEXT,
    name TEXT,
    summary TEXT,
    space   TEXT,
    description TEXT,
    experiences_offered TEXT,
    neighborhood_overview TEXT,
    notes   TEXT,
    transit TEXT,
    access  TEXT,
    interaction TEXT,
    house_rules TEXT,
    thumbnail_url TEXT,
    medium_url TEXT,
    picture_url TEXT,
    xl_picture_url TEXT,
    host_id INT,
    host_url    TEXT,
    host_name   TEXT,
    host_since  TIMESTAMP,
    host_location   TEXT,
    host_about  TEXT,
    host_response_time  TEXT,
    host_response_rate  TEXT,
    host_acceptance_rate TEXT,
    host_is_superhost BOOLEAN,
    host_thumbnail_url  TEXT,
    host_picture_url    TEXT,
    host_neighbourhood TEXT,
    host_listings_count INT,
    host_total_listings_count   INT,
    host_verifications  TEXT,
    host_has_profile_pic    BOOLEAN,
    host_identity_verified  BOOLEAN,
    street  TEXT,
    neighbourhood   TEXT,
    neighbourhood_cleansed  TEXT,
    neighbourhood_group_cleansed TEXT,
    city    TEXT,
    state TEXT,
    zipcode TEXT,
    market  TEXT,
    smart_location  TEXT,
    country_code    TEXT,
    country TEXT,
    latitude    DECIMAL(15),
    longitude   DECIMAL(15),
    is_location_exact   BOOLEAN,
    property_type   TEXT,
    room_type   TEXT,
    accomodates INT,
    bathrooms   DECIMAL(10),
    bedrooms    INT,
    beds    INT,
    bed_type    TEXT,
    amenities   TEXT,
    square_feet  INT,
    price   money,
    weekly_price    money,
    monthly_price   money,
    security_deposit    money,
    cleaning_fee    money,
    guests_included INT,
    extra_people    money,
    minimum_nights  INT,
    maximum_nights  INT,
    minimum_minimum_nights  INT,
    maximum_minimum_nights  INT,
    minimum_maximum_nights  INT,
    maximum_maximum_nights  INT,
    minimum_nights_avg_ntm    DECIMAL(10),
    maximum_nights_avg_ntm    DECIMAL(10),
    calendar_updated    TEXT,
    has_availability    BOOLEAN,
    availability_30     INT,
    availability_60     INT,
    availability_90     INT,
    availability_365     INT,
    calendar_last_scraped   TIMESTAMP,
    number_of_reviews   INT,
    number_of_reviews_ltm INT,
    first_review    TIMESTAMP,
    last_review     TIMESTAMP,
    review_scores_rating    INT,
    review_scores_accuracy    INT,
    review_scores_cleanliness    INT,
    review_scores_checkin    INT,
    review_scores_communication    INT,
    review_scores_location    INT,
    review_scores_value    INT,
    requires_license    BOOLEAN,
    license     TEXT,
    jurisdiction_names TEXT,
    instant_bookable    BOOLEAN,
    is_business_travel_ready    TEXT,
    cancellation_policy     TEXT,
    require_guest_profile_picture   TEXT,
    require_guest_phone_verification   TEXT,
    calculated_host_listings_count  DECIMAL(10),
    calculated_host_listings_count_entire_homes  DECIMAL(10),
    calculated_host_listings_count_private_rooms  DECIMAL(10),
    calculated_host_listings_count_shared_rooms  DECIMAL(10),
    reviews_per_month   TEXT,
    PRIMARY KEY(id)
);

GRANT ALL ON TABLE data_source.listings_data TO amerc084;
GRANT ALL ON TABLE data_source.listings_data TO jbass084;
GRANT ALL ON TABLE data_source.listings_data TO pbara036;

CREATE TABLE IF NOT EXISTS data_source.reviews_data (
    listing_id      INT,
    id      INT,
    date TIMESTAMP,
    reviewer_id     INT,
    reviewer_name   TEXT,
    comments    TEXT,
    PRIMARY KEY(id)
);

GRANT ALL ON TABLE data_source.reviews_data TO amerc084;
GRANT ALL ON TABLE data_source.reviews_data TO jbass084;
GRANT ALL ON TABLE data_source.reviews_data TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.property_type_table (
	id SERIAL,
	name TEXT,
	icon_image_path TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.property_type_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.property_type_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.property_type_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.booking_types_table (
	id SERIAL,
	name TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.booking_types_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.booking_types_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.booking_types_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.bookings_table (
	id SERIAL,
	booking_type_id INT,
	property_id INT,
	user_id INT,
	check_in_date TIMESTAMP,
	check_out_date TIMESTAMP,
	price_per_day DECIMAL(10),
	site_fees DECIMAL(10),
	amount_paid DECIMAL(10),
	is_refundable BOOLEAN,
	cancel_date TIMESTAMP,
	refund_paid BOOLEAN,
	transaction_id INT,
	booking_date TIMESTAMP,
	booking_status BOOLEAN,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.bookings_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.bookings_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.bookings_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.currencies_table (
id SERIAL,
name TEXT,
symbol TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
status SMALLINT,
PRIMARY KEY (id)
);

GRANT ALL ON TABLE AirBnB_Group_40.currencies_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.currencies_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.currencies_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.users_table (
	id INT,
	name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255),
	address_id INT,
	language_id INT,
	phone_number VARCHAR(255),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.users_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.users_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.users_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.languages_table (
	id SERIAL,
	name TEXT,
	code TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY (id)
);

GRANT ALL ON TABLE AirBnB_Group_40.languages_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.languages_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.languages_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.properties_table (
	id INT NOT NULL,
	name INT,
	description TEXT,
	host_id INT,
	property_type_id INT,
	room_type_id INT,
	category_id INT,
	address_id INT,
	language_id INT,
	bedroom_count INT,
	bathroom_count INT,
	accomodates_count INT,
	rating INT,
	availability_type SMALLINT,
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	country_id INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.properties_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.properties_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.properties_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.addresses_table (
	id SERIAL,
	number INT,
	street_name VARCHAR(255),
	city VARCHAR(255),
	province VARCHAR(255),
	country_id INT,
	postal_code TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.addresses_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.addresses_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.addresses_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.room_type_table (
	id SERIAL,
	name TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.room_type_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.room_type_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.room_type_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.categories_table (
	id SERIAL,
	name TEXT,
	description TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.categories_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.categories_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.categories_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.payments_type_table (
	id SERIAL,
	name TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.payments_type_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.payments_type_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.payments_type_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.property_images_table (
	id SERIAL,
	property_id INT,
	image_path TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.property_images_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.property_images_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.property_images_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.employees_table (
	id SERIAL,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	email VARCHAR(255),
	branch_id INT,
	salary DECIMAL(10),
	post VARCHAR(255),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.employees_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.employees_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.employees_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.branches_table (
	id SERIAL,
	name VARCHAR(255),
	manager_id INT,
	country_id INT,
	address_id INT,
	nbr_of_employees INT,
	tax_rate DECIMAL(10),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.branches_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.branches_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.branches_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.reviews_table (
	id SERIAL,
	user_id INT,
	property_id INT,
	description TEXT,
	rating DECIMAL(10),
	cleanliness DECIMAL(10),
	communications INT,
	value INT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.reviews_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.reviews_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.reviews_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.agreements_table (
	id SERIAL,
	booking_id INT,
	user_signature_path TEXT,
	host_signature_path DECIMAL(10),
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.agreements_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.agreements_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.agreements_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.transactions_table (
	id SERIAL,
	booking_id INT,
	site_fees DECIMAL(10),
	amount DECIMAL(10),
	transfer_on TIMESTAMP,
	currency_id INT,
	payment_type_id INT,
	payment_status SMALLINT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.transactions_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.transactions_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.transactions_table TO pbara036;

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.countries_table (
	id SERIAL,
	name TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

GRANT ALL ON TABLE AirBnB_Group_40.countries_table TO amerc084;
GRANT ALL ON TABLE AirBnB_Group_40.countries_table TO jbass084;
GRANT ALL ON TABLE AirBnB_Group_40.countries_table TO pbara036;

ALTER TABLE AirBnB_Group_40.bookings_table DROP CONSTRAINT IF EXISTS bookings_table_booking_type_id_fkey;
ALTER TABLE AirBnB_Group_40.bookings_table ADD FOREIGN KEY (booking_type_id) REFERENCES AirBnB_Group_40.booking_types_table(id);
ALTER TABLE AirBnB_Group_40.bookings_table DROP CONSTRAINT IF EXISTS bookings_table_property_id_fkey;
ALTER TABLE AirBnB_Group_40.bookings_table ADD FOREIGN KEY (property_id) REFERENCES AirBnB_Group_40.properties_table(id);
ALTER TABLE AirBnB_Group_40.bookings_table DROP CONSTRAINT IF EXISTS bookings_table_user_id_fkey;
ALTER TABLE AirBnB_Group_40.bookings_table ADD FOREIGN KEY (user_id) REFERENCES AirBnB_Group_40.users_table(id);
ALTER TABLE AirBnB_Group_40.bookings_table DROP CONSTRAINT IF EXISTS bookings_table_transaction_id_fkey;
ALTER TABLE AirBnB_Group_40.bookings_table ADD FOREIGN KEY (transaction_id) REFERENCES AirBnB_Group_40.transactions_table(id);

ALTER TABLE AirBnB_Group_40.users_table DROP CONSTRAINT IF EXISTS users_table_address_id_fkey;
ALTER TABLE AirBnB_Group_40.users_table ADD FOREIGN KEY (address_id) REFERENCES AirBnB_Group_40.addresses_table(id);
ALTER TABLE AirBnB_Group_40.users_table DROP CONSTRAINT IF EXISTS users_table_language_id_fkey;
ALTER TABLE AirBnB_Group_40.users_table ADD FOREIGN KEY (language_id) REFERENCES AirBnB_Group_40.languages_table(id);

ALTER TABLE AirBnB_Group_40.properties_table DROP CONSTRAINT IF EXISTS properties_table_address_id_fkey;
ALTER TABLE AirBnB_Group_40.properties_table ADD FOREIGN KEY (host_id) REFERENCES AirBnB_Group_40.users_table(id);
ALTER TABLE AirBnB_Group_40.properties_table DROP CONSTRAINT IF EXISTS properties_table_property_type_id_fkey;
ALTER TABLE AirBnB_Group_40.properties_table ADD FOREIGN KEY (property_type_id) REFERENCES AirBnB_Group_40.property_type_table(id);
ALTER TABLE AirBnB_Group_40.properties_table DROP CONSTRAINT IF EXISTS properties_table_room_type_id_fkey;
ALTER TABLE AirBnB_Group_40.properties_table ADD FOREIGN KEY (room_type_id) REFERENCES AirBnB_Group_40.room_type_table(id);
ALTER TABLE AirBnB_Group_40.properties_table DROP CONSTRAINT IF EXISTS properties_table_category_id_fkey;
ALTER TABLE AirBnB_Group_40.properties_table ADD FOREIGN KEY (category_id) REFERENCES AirBnB_Group_40.categories_table(id);
ALTER TABLE AirBnB_Group_40.properties_table DROP CONSTRAINT IF EXISTS properties_table_address_id_fkey;
ALTER TABLE AirBnB_Group_40.properties_table ADD FOREIGN KEY (address_id) REFERENCES AirBnB_Group_40.addresses_table(id);
ALTER TABLE AirBnB_Group_40.properties_table DROP CONSTRAINT IF EXISTS properties_table_language_id_fkey;
ALTER TABLE AirBnB_Group_40.properties_table ADD FOREIGN KEY (language_id) REFERENCES AirBnB_Group_40.languages_table(id);
ALTER TABLE AirBnB_Group_40.properties_table DROP CONSTRAINT IF EXISTS properties_table_country_id_fkey;
ALTER TABLE AirBnB_Group_40.properties_table ADD FOREIGN KEY (country_id) REFERENCES AirBnB_Group_40.countries_table(id);

ALTER TABLE AirBnB_Group_40.addresses_table DROP CONSTRAINT IF EXISTS addresses_table_country_id_fkey;
ALTER TABLE AirBnB_Group_40.addresses_table ADD FOREIGN KEY (country_id) REFERENCES AirBnB_Group_40.countries_table(id);

ALTER TABLE AirBnB_Group_40.employees_table DROP CONSTRAINT IF EXISTS employees_table_branch_id_fkey;
ALTER TABLE AirBnB_Group_40.employees_table ADD FOREIGN KEY (branch_id) REFERENCES AirBnB_Group_40.branches_table(id);

ALTER TABLE AirBnB_Group_40.branches_table DROP CONSTRAINT IF EXISTS branches_table_manager_id_fkey;
ALTER TABLE AirBnB_Group_40.branches_table ADD FOREIGN KEY (manager_id) REFERENCES AirBnB_Group_40.employees_table(id);
ALTER TABLE AirBnB_Group_40.branches_table DROP CONSTRAINT IF EXISTS branches_table_country_id_fkey;
ALTER TABLE AirBnB_Group_40.branches_table ADD FOREIGN KEY (country_id) REFERENCES AirBnB_Group_40.countries_table(id);
ALTER TABLE AirBnB_Group_40.branches_table DROP CONSTRAINT IF EXISTS branches_table_address_id_fkey;
ALTER TABLE AirBnB_Group_40.branches_table ADD FOREIGN KEY (address_id) REFERENCES AirBnB_Group_40.addresses_table(id);

ALTER TABLE AirBnB_Group_40.reviews_table DROP CONSTRAINT IF EXISTS reviews_table_user_id_fkey;
ALTER TABLE AirBnB_Group_40.reviews_table ADD FOREIGN KEY (user_id) REFERENCES AirBnB_Group_40.users_table(id);
ALTER TABLE AirBnB_Group_40.reviews_table DROP CONSTRAINT IF EXISTS reviews_table_property_id_fkey;
ALTER TABLE AirBnB_Group_40.reviews_table ADD FOREIGN KEY (property_id) REFERENCES AirBnB_Group_40.properties_table(id);

ALTER TABLE AirBnB_Group_40.agreements_table DROP CONSTRAINT IF EXISTS agreements_table_booking_id_fkey;
ALTER TABLE AirBnB_Group_40.agreements_table ADD FOREIGN KEY (booking_id) REFERENCES AirBnB_Group_40.bookings_table(id);

ALTER TABLE AirBnB_Group_40.transactions_table DROP CONSTRAINT IF EXISTS transactions_table_booking_id_fkey;
ALTER TABLE AirBnB_Group_40.transactions_table ADD FOREIGN KEY (booking_id) REFERENCES AirBnB_Group_40.bookings_table(id);
ALTER TABLE AirBnB_Group_40.transactions_table DROP CONSTRAINT IF EXISTS transactions_table_payment_type_id_fkey;
ALTER TABLE AirBnB_Group_40.transactions_table ADD FOREIGN KEY (payment_type_id) REFERENCES AirBnB_Group_40.payments_type_table(id);
ALTER TABLE AirBnB_Group_40.transactions_table DROP CONSTRAINT IF EXISTS transactions_table_currency_id_fkey;
ALTER TABLE AirBnB_Group_40.transactions_table ADD FOREIGN KEY (currency_id) REFERENCES AirBnB_Group_40.currencies_table(id);

ALTER TABLE AirBnB_Group_40.property_images_table DROP CONSTRAINT IF EXISTS property_images_table_property_id_fkey;
ALTER TABLE AirBnB_Group_40.property_images_table ADD FOREIGN KEY (property_id) REFERENCES AirBnB_Group_40.properties_table(id);