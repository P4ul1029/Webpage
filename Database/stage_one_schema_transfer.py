from DBConnect import DatabaseConnection


class stage_one_DAL(object):
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

        sql_insert1 = """INSERT INTO AirBnB_Group_40.countries_table(
                            name)
                        SELECT (country)
                        FROM data_source.listings_data
                        WHERE NOT EXISTS (
                            SELECT id
                            FROM AirBnB_Group_40.countries_table
                            WHERE AirBnB_Group_40.countries_table.name = country)
                        ON CONFLICT DO NOTHING
                        """
        sql_insert2 = """INSERT INTO AirBnB_Group_40.users_table(
                            id,
                            name)
	                    SELECT host_id, host_name
	                    FROM data_source.listings_data
	                    ON CONFLICT DO NOTHING
	                    """

        sql_insert3 = """INSERT INTO AirBnB_Group_40.room_type_table(
	                        name)
	                    SELECT room_type
	                    FROM data_source.listings_data
	                    ON CONFLICT DO NOTHING
	                    """

        sql_insert5 = """INSERT INTO AirBnB_Group_40.reviews_table(
	                        id,
	                        user_id,
	                        property_id,
	                        description,
	                        created_at)
	                    SELECT id, reviewer_id, listing_id, comments, date
	                    FROM data_source.reviews_data
	                    WHERE EXISTS (
                           SELECT id
                           FROM AirBnB_Group_40.users_table
                           WHERE AirBnB_Group_40.users_table.id = reviewer_id
                        )
                        AND EXISTS
                        (
                           SELECT id
                           FROM AirBnB_Group_40.properties_table
                           WHERE AirBnB_Group_40.properties_table.id = listing_id
                        )
	                    ON CONFLICT DO NOTHING
                        """

        with connection.cursor() as cursor:
            cursor.execute(sql_insert1)
            cursor.execute(sql_insert2)
            cursor.execute(sql_insert3)
            cursor.execute(sql_insert5)
            connection.close()