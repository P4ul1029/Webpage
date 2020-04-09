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
    db.get_connection().close()


def _create_schemas():
    print("Initializing schemas...")
    db = DatabaseConnection()
    connection = db.get_connection()

    with connection.cursor() as cursor:
        with open("sql/schemas.sql", "r") as f:
            sql = f.read()
            cursor.execute(sql)

    print("Schemas successfully created.")
    connection.close()


class DataSource(object):

    data_source_files = config(filename='database.ini', section='data_source_files')

    Berlin_Calendar_Data = data_source_files.get('berlin_calendar_data')
    Berlin_Listings_Data = data_source_files.get('berlin_listings_data')
    Berlin_Listings_Summary_Data = data_source_files.get('berlin_listings_summary_data')
    Berlin_Neighbourhoods_Data = data_source_files.get('berlin_neighbourhoods_data')
    Berlin_Reviews_Data = data_source_files.get('berlin_reviews_data')
    Berlin_Reviews_Summary_Data = data_source_files.get('berlin_reviews_summary_data')

    Boston_Calendar_Data = data_source_files.get('boston_calendar_data')
    Boston_Listings_Data = data_source_files.get('boston_listings_data')
    Boston_Reviews_Data = data_source_files.get('boston_reviews_data')

    Madrid_Calendar_Data = data_source_files.get('madrid_calendar_data')
    Madrid_Listings_Data = data_source_files.get('madrid_listings_data')
    Madrid_Listings_Summary_Data = data_source_files.get('madrid_listings_summary_data')
    Madrid_Neighbourhoods_Data = data_source_files.get('madrid_neighbourhoods_data')
    Madrid_Reviews_Data = data_source_files.get('madrid_reviews_data')
    Madrid_Reviews_Summary_Data = data_source_files.get('madrid_reviews_summary_data')

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

        print("Populating data_source.X_calendar_data...")

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
        #self.copy_data_from_csv(self.Madrid_Calendar_Data, sql)
        #print(self.Madrid_Calendar_Data + " successfully inserted into db")

        print("data_source.calendar_data successfully populated.")


    def populate_listings_table(self):
        print("Populating data_source.listings_data...")

        sql = """COPY data_source.listings_data(
                id,
                listing_url,
                scrape_id,
                last_scraped,
                name,
                summary,
                space,
                description,
                experiences_offered,
                neighborhood_overview,
                notes,
                transit,
                access,
                interaction,
                house_rules,
                thumbnail_url,
                medium_url,
                picture_url,
                xl_picture_url,
                host_id,
                host_url,
                host_name,
                host_since,
                host_location,
                host_about,
                host_response_time,
                host_response_rate,
                host_acceptance_rate,
                host_is_superhost,
                host_thumbnail_url,
                host_picture_url,
                host_neighbourhood,
                host_listings_count,
                host_total_listings_count,
                host_verifications,
                host_has_profile_pic,
                host_identity_verified,
                street,
                neighbourhood,
                neighbourhood_cleansed,
                neighbourhood_group_cleansed,
                city,
                state,
                zipcode,
                market,
                smart_location,
                country_code,
                country,
                latitude,
                longitude,
                is_location_exact,
                property_type,
                room_type,
                accomodates,
                bathrooms,
                bedrooms,
                beds,
                bed_type,
                amenities,
                square_feet,
                price,
                weekly_price,
                monthly_price,
                security_deposit,
                cleaning_fee,
                guests_included,
                extra_people,
                minimum_nights,
                maximum_nights,
                minimum_minimum_nights,
                maximum_minimum_nights,
                minimum_maximum_nights,
                maximum_maximum_nights,
                minimum_nights_avg_ntm,
                maximum_nights_avg_ntm,
                calendar_updated,
                has_availability,
                availability_30,
                availability_60,
                availability_90,
                availability_365,
                calendar_last_scraped,
                number_of_reviews,
                number_of_reviews_ltm,
                first_review,
                last_review,
                review_scores_rating,
                review_scores_accuracy,
                review_scores_cleanliness,
                review_scores_checkin,
                review_scores_communication,
                review_scores_location,
                review_scores_value,
                requires_license,
                license,
                jurisdiction_names,
                instant_bookable,
                is_business_travel_ready,
                cancellation_policy,
                require_guest_profile_picture,
                require_guest_phone_verification,
                calculated_host_listings_count,
                calculated_host_listings_count_entire_homes,
                calculated_host_listings_count_private_rooms,
                calculated_host_listings_count_shared_rooms,
                reviews_per_month)
                FROM STDIN CSV HEADER NULL ''"""

        self.copy_data_from_csv(self.Berlin_Listings_Data, sql)
        print(self.Berlin_Listings_Data + " successfully inserted into db")
        self.copy_data_from_csv(self.Boston_Listings_Data, sql)
        print(self.Boston_Listings_Data + " successfully inserted into db")
        #self.copy_data_from_csv(self.Madrid_Listings_Data, sql)
        #print(self.Madrid_Listings_Data + " successfully inserted into db")

        print("data_source.listings_data successfully populated.")

    def populate_reviews_table(self):
        print("Populating data_source.reviews_data...")

        sql = """COPY data_source.reviews_data(
                listing_id,
                id,
                date,
                reviewer_id,
                reviewer_name,
                comments)
                FROM STDIN CSV HEADER NULL ''"""

        self.copy_data_from_csv(self.Berlin_Reviews_Summary_Data, sql)
        print(self.Berlin_Reviews_Data + " successfully inserted into db")
        self.copy_data_from_csv(self.Boston_Reviews_Data, sql)
        print(self.Boston_Reviews_Data + " successfully inserted into db")
        #self.copy_data_from_csv(self.Madrid_Reviews_Data, sql)
        #print(self.Madrid_Reviews_Data + " successfully inserted into db")

        print("data_source.reviews_data successfully populated.")

    @staticmethod
    def copy_data_from_csv(file_path, sql):
        db = DatabaseConnection()
        connection = db.get_connection()

        print("Opening "+str(file_path))

        with connection.cursor() as cursor:
            with open(file_path, encoding="utf8") as f:
                cursor.copy_expert(file=f, sql=sql)
                connection.commit()
        connection.close()
