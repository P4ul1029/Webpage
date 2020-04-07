from DBConnect import DatabaseConnection
from config import config


def init_schemas():
    _get_postgres_version()
    _create_schemas()


def _get_postgres_version():
    db = DatabaseConnection()

    with db.get_connection().cursor() as cursor:
        cursor.execute('SELECT version()')
        db_version = cursor.fetchone()
        print('PostgreSQL database version: ' + db_version[0])


def _create_schemas():
    print("Initializing schemas...")
    db = DatabaseConnection()
    connection = db.get_connection()

    with connection.cursor() as cursor:
        with open("db/sql/schemas.sql", "r") as f:
            sql = f.read()
            cursor.execute(sql)

    print("Schemas successfully created.")


class DataSource(object):

    data_source_files = config(section='data_source_files')

    Berlin_Calendar_Data = data_source_files.get('Berlin_Calendar_Data')
    Berlin_Listings_Data = data_source_files.get('Berlin_Listings_Data')
    Berlin_Listings_Summary_Data = data_source_files.get('Berlin_Listings_Summary_Data')
    Berlin_Neighbourhoods_Data = data_source_files.get('Berlin_Neighbourhoods_Data')
    Berlin_Reviews_Data = data_source_files.get('Berlin_Reviews_Data')
    Berlin_Reviews_Summary_Data = data_source_files.get('Berlin_Reviews_Summary_Data')

    Boston_Calendar_Data = data_source_files.get('Boston_Calendar_Data')
    Boston_Listings_Data = data_source_files.get('Boston_Listings_Data')
    Boston_Reviews_Data = data_source_files.get('Boston_Reviews_Data')

    Madrid_Calendar_Data = data_source_files.get('Madrid_Calendar_Data')
    Madrid_Listings_Data = data_source_files.get('Madrid_Listings_Data')
    Madrid_Listings_Summary_Data = data_source_files.get('Madrid_Listings_Summary_Data')
    Madrid_Neighbourhoods_Data = data_source_files.get('Madrid_Neighbourhoods_Data')
    Madrid_Reviews_Data = data_source_files.get('Madrid_Reviews_Data')
    Madrid_Reviews_Summary_Data = data_source_files.get('Madrid_Reviews_Summary_Data')

    def __init__(self,
                 populate_calendar_data=False,
                 populate_listings_data=False,
                 populate_reviews_data=False):

        # POPULATE CALENDAR DATA
        self.populate_calendar_data = populate_calendar_data

        # POPULATE LISTINGS DATA
        self.populate_listings_data = populate_listings_data

        # POPULATE REVIEWS DATA
        self.populate_reviews_data = populate_reviews_data

    def populate(self):

        if self.populate_calendar_data:
            self.populate_calendar_table()
        if self.populate_listings_data:
            self.populate_listings_table()
        if self.populate_reviews_data:
            self.populate_reviews_table()



    def populate_calendar_table(self):
        print("data_source.berlin_calendar_data...")

        sql = """COPY data_source.calendar_data(
                listing_id,
                date,
                available,
                price)
                FROM STDIN CSV HEADER NULL ''"""

        self.copy_data_from_csv(self.Berlin_Calendar_Data, sql)
        print(self.Berlin_Calendar_Data + " successfully inserted into db")
        self.copy_data_from_csv(self.Boston_Calendar_Data, sql)
        print(self.Boston_Calendar_Data + " successfully inserted into db")
        self.copy_data_from_csv(self.Madrid_Calendar_Data, sql)
        print(self.Madrid_Calendar_Data + " successfully inserted into db")

        print("data_source.calendar_data successfully populated.")


    def populate_listings_table(self):
        print("Populating data_source.listings_data...")

        sql = """COPY data_source.listings_data(
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
                PRIMARY KEY(id))
                FROM STDIN CSV HEADER NULL ''"""

        self.copy_data_from_csv(self.Berlin_Listings_Data, sql)
        print(self.Berlin_Listings_Data + " successfully inserted into db")
        self.copy_data_from_csv(self.Boston_Listings_Data, sql)
        print(self.Boston_Listings_Data + " successfully inserted into db")
        self.copy_data_from_csv(self.Madrid_Listings_Data, sql)
        print(self.Madrid_Listings_Data + " successfully inserted into db")

        print("data_source.listings_data successfully populated.")

    def populate_reviews_data(self):
        print("Populating data_source.reviews_data...")

        sql = """COPY data_source.climate_data_alberta(
                listing_id      SERIAL,
                id      INT,
                date TIMESTAMP,
                reviewer_id     INT,
                reviewer_name   TEXT,
                comments    TEXT)
                FROM STDIN CSV HEADER NULL ''"""

        self.copy_data_from_csv(self.Berlin_Reviews_Data, sql)
        print(self.Berlin_Reviews_Data + " successfully inserted into db")
        self.copy_data_from_csv(self.Boston_Reviews_Data, sql)
        print(self.Boston_Reviews_Data + " successfully inserted into db")
        self.copy_data_from_csv(self.Madrid_Reviews_Data, sql)
        print(self.Madrid_Reviews_Data + " successfully inserted into db")

        print("data_source.reviews_data successfully populated.")

    @staticmethod
    def create_filtered_stations_table(sql, stations):
        db = DatabaseConnection()
        connection = db.get_connection()

        with connection.cursor() as cursor:
            cursor.execute(sql, (stations,))

    @staticmethod
    def copy_data_from_csv(file_path, sql):
        db = DatabaseConnection()
        connection = db.get_connection()

        with connection.cursor() as cursor:
            with open(file_path) as f:
                cursor.copy_expert(file=f, sql=sql)