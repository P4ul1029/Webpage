import DBConnect


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
        db = DBConnect()

        sql_insert = """INSERT INTO AirBnB_Group_40.countries_table(
                            name)
                        SELECT (country)
                        FROM data_source.listings_table
                        
                        INSERT INTO AirBnB_Group_40.users_table(
                            id,
                            name)
	                    SELECT (host_id, host_name)
	                    FROM data_source.listings_table
	                    
	                    INSERT INTO AirBnB_Group_40.room_type_table(
	                        name)
	                    SELECT room_type
	                    FROM data_source.listings_table
	                    
	                    INSERT INTO AirBnB_Group_40.property_images_table(
	                        property_id,
	                        image_path)
	                    SELECT (id, thumbnail_url)
	                    FROM data_source.listings_table
	                    
	                    INSERT INTO AirBnB_Group_40.property_images_table(
	                        property_id,
	                        image_path)
	                    SELECT (id, medium_url)
	                    FROM data_source.listings_table
	                    
	                    INSERT INTO AirBnB_Group_40.property_images_table(
	                        property_id,
	                        image_path)
	                    SELECT (id, picture_url)
	                    FROM data_source.listings_table
	                    
	                    INSERT INTO AirBnB_Group_40.property_images_table(
	                        property_id,
	                        image_path)
	                    SELECT (id, xl_picture_url)
	                    FROM data_source.listings_table
	                    
	                    INSERT INTO AirBnB_Group_40.reviews_table(
	                        id,
	                        user_id,
	                        property_id,
	                        description,
	                        created_at)
	                    SELECT (id, reviewer_id, listing_id, comments, date)
	                    FROM data_source.reviews_table
	                        
	                        
	                        """

        with db.get_connection().cursor() as cursor:
            cursor.execute(sql_insert)