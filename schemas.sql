CREATE SCHEMA IF NOT EXISTS AirBnB_Group_40;
CREATE SCHEMA IF NOT EXISTS relations;
CREATE SCHEMA IF NOT EXISTS data_source;

CREATE TABLE IF NOT EXISTS data_source.calendar_data (
    listing_id      SERIAL,
    date    TIMESTAMP,
    available   BOOLEAN,
    price   TEXT,
    PRIMARY KEY(listing_id)
);

CREATE TABLE IF NOT EXISTS data_source.listings_data (
    id  SERIAL,
    listing_url TEXT,
    scrape_id   SERIAL,
    last_scraped    SERIAL,
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
    thumbnail_url   TEXT,
    medium_url  TEXT,
    picture_url TEXT,
    xl_picture_url  TEXT,
    host_id SERIAL,
    host_url    TEXT,
    host_name   TEXT,
    host_since  INT,
    host_location   TEXT,
    host_about  TEXT,
    host_response_time  TEXT,
    host_response_rate  DECIMAL(5),
    host_acceptance_rate DECIMAL(5),
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
    zipcode INT,
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
    bathrooms   INT,
    bedrooms    INT,
    beds    INT,
    bed_type    TEXT,
    amenities   TEXT,
    square_feet  INT,
    price   INT,
    weekly_price    INT,
    monthly_price   INT,
    security_deposit    INT,
    cleaning_fee    INT,
    guests_included INT,
    extra_people    INT,
    minimum_nights  INT,
    maximum_nights  INT,
    calendar_updated    TEXT,
    has_availability    BOOLEAN,
    availability_30     INT,
    availability_60     INT,
    availability_90     INT,
    availability_365     INT,
    calendar_last_scraped   INT,
    number_of_reviews   INT,
    first_review    INT,
    last_review     INT,
    review_scores_rating    INT,
    review_scores_accuracy    INT,
    review_scores_cleanliness    INT,
    review_scores_checkin    INT,
    review_scores_communication    INT,
    review_scores_location    INT,
    review_scores_value    INT,
    requires_license    BOOLEAN,
    license     TEXT,
    jurisdiction_names  TEXT,
    instant_bookable    BOOLEAN,
    is_business_travel_ready    BOOLEAN,
    cancellation_policy     TEXT,
    require_guest_profile_picture   BOOLEAN,
    require_guest_phone_verification   BOOLEAN,
    calculated_host_listings_count  INT,
    reviews_per_month   DECIMAL(2),
    PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS data_source.reviews_data (
    listing_id      SERIAL,
    id      INT,
    date TIMESTAMP,
    reviewer_id     INT,
    reviewer_name   TEXT,
    comments    TEXT,
    PRIMARY KEY(listing_id)
);


CREATE TABLE IF NOT EXISTS AirBnB_Group_40.property_type_table (
	id INT,
	name TEXT,
	icon_image_path TEXT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.booking_type_table (
	id INT,
	name TEXT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.bookings_table (
	id INT,
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
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.currencies_table (
id INT,
name TEXT,
symbol TEXT,
created_at TIMESTAMP,
modified_at TIMESTAMP,
status SMALLINT,
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.users_table (
	id INT,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255),
	address_id INT,
	language_id INT,
	phone_number VARCHAR(255),
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.languages_table (
	id INT,
	name TEXT,
	code TEXT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.properties_table (
	id INT,
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
	availability_type SMALLINT,
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	country_id INT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.addresses_table (
	id INT,
	number INT,
	street_name VARCHAR(255),
	city VARCHAR(255),
	province VARCHAR(255),
	country_id INT,
	postal_code TEXT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.room_type_table (
	id INT,
	name TEXT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.categories_table (
	id INT,
	name TEXT,
	description TEXT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.payments_type_table (
	id INT,
	name TEXT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.property_images_table (
	id INT,
	property_id INT,
	image_path TEXT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.employees_table (
	id INT,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	email VARCHAR(255),
	branch_id INT,
	salary DECIMAL(10),
	post VARCHAR(255),
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.branches_table (
	id INT,
	name VARCHAR(255),
	manager_id INT,
	country_id INT,
	address_id INT,
	nbr_of_employees INT,
	tax_rate DECIMAL(10),
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.reviews_table (
	id INT,
	user_id INT,
	property_id INT,
	description TEXT,
	rating DECIMAL(10),
	cleanliness DECIMAL(10),
	communications INT,
	value INT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.agreements_table (
	id INT,
	booking_id INT,
	user_signature_path TEXT,
	host_signature_path DECIMAL(10),
	start_date TIMESTAMP,
	end_date TIMESTAMP,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.transactions_table (
	id INT,
	booking_id INT,
	site_fees DECIMAL(10),
	amount DECIMAL(10),
	transfer_on TIMESTAMP,
	currency_id INT,
	payment_type_id INT,
	payment_status SMALLINT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS AirBnB_Group_40.countries_table (
	id INT,
	name INT,
	created_at TIMESTAMP,
	modified_at TIMESTAMP,
	status SMALLINT,
	PRIMARY KEY(id)
);

ALTER TABLE bookings_table ADD FOREIGN KEY (booking_type_id) REFERENCES booking_type_table(id);
ALTER TABLE bookings_table ADD FOREIGN KEY (property_id) REFERENCES properties_table(id);
ALTER TABLE bookings_table ADD FOREIGN KEY (user_id) REFERENCES users_table(id);
ALTER TABLE bookings_table ADD FOREIGN KEY (transaction_id) REFERENCES transactions_table(id);

ALTER TABLE users_table ADD FOREIGN KEY (address_id) REFERENCES addresses_table(id);
ALTER TABLE users_table ADD FOREIGN KEY (language_id) REFERENCES languages_table(id);

ALTER TABLE properties_table ADD FOREIGN KEY (host_id) REFERENCES users_table(id);
ALTER TABLE properties_table ADD FOREIGN KEY (property_type_id) REFERENCES property_type_table(id);
ALTER TABLE properties_table ADD FOREIGN KEY (room_type_id) REFERENCES room_type_table(id);
ALTER TABLE properties_table ADD FOREIGN KEY (category_id) REFERENCES categories_table(id);
ALTER TABLE properties_table ADD FOREIGN KEY (address_id) REFERENCES addresses_table(id);
ALTER TABLE properties_table ADD FOREIGN KEY (language_id) REFERENCES languages_table(id);
ALTER TABLE properties_table ADD FOREIGN KEY (country_id) REFERENCES countries_table(id);

ALTER TABLE addresses_table ADD FOREIGN KEY (country_id) REFERENCES countries_table(id);

ALTER TABLE employees_table ADD FOREIGN KEY (branch_id) REFERENCES branches_table(id);

ALTER TABLE branches_table ADD FOREIGN KEY (manager_id) REFERENCES employees_table(id);
ALTER TABLE branches_table ADD FOREIGN KEY (country_id) REFERENCES countries_table(id);
ALTER TABLE branches_table ADD FOREIGN KEY (address_id) REFERENCES addresses_table(id);

ALTER TABLE reviews_table ADD FOREIGN KEY (user_id) REFERENCES users_table(id);
ALTER TABLE reviews_table ADD FOREIGN KEY (property_id) REFERENCES properties_table(id);

ALTER TABLE agreements_table ADD FOREIGN KEY (booking_id) REFERENCES bookings_table(id);

ALTER TABLE transactions_table ADD FOREIGN KEY (booking_id) REFERENCES bookings_table(id);
ALTER TABLE transactions_table ADD FOREIGN KEY (payment_type_id) REFERENCES payments_type_table(id);
ALTER TABLE transactions_table ADD FOREIGN KEY (currency_id) REFERENCES currencies_table(id);

ALTER TABLE property_images_table ADD FOREIGN KEY (property_id) REFERENCES properties_table(id);
