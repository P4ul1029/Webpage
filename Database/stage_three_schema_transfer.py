from DBConnect import DatabaseConnection


class stage_three_DAL(object):
    """
    This functionality of this class is to interact with the database.
    All methods defined in the class must be solely responsible
    for reading and writing to 'AirBnB_Group_40'.
    No business logic is allowed here.
    """

    @staticmethod
    def insert_many():
        """
        Copies data from listings table into the bookings table and other associated tables
        :return: None
        """
        db = DatabaseConnection()
        connection = db.get_connection()

        sql_insert = """INSERT INTO AirBnB_Group_40.properties_table(
	                            id,
	                            name,
	                            description,
	                            bedroom_count,
	                            bathroom_count,
	                            accomodates_count,
	                            rating,
	                            rate)
	                        SELECT id, name, description,
	                               bedrooms, bathrooms, accomodates, review_scores_rating, CAST(CAST(price AS NUMERIC) AS FLOAT)
	                        FROM data_source.listings_data
	                                ON CONFLICT DO NOTHING"""


        with connection.cursor() as cursor:
            cursor.execute(sql_insert)
            connection.close()

