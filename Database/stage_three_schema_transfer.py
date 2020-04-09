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
	                            host_id,
	                            room_type_id,
	                            address_id,
	                            bedroom_count,
	                            bathroom_count,
	                            accomodates_count,
	                            rating,
	                            country_id)
	                        SELECT (id, name, description, host_id, (SELECT room.id FROM AirBnB_Group_40.room_type_table room WHERE room.name = room_type),
	                                (SELECT addy.id FROM AirBnB_Group_40.addresses_table addy WHERE (addy.street = street)),
	                                bedrooms, bathrooms, accomodates, review_scores_rating,
	                                (SELECT Country.id FROM AirBnB_Group_40.countries_table Country WHERE Country.name = country)"""


        with connection.cursor() as cursor:
            cursor.execute(sql_insert)
            connection.close()

