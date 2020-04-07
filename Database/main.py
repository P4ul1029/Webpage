from initialize import init_schemas, DataSource
from stage_one_schema_transfer import stage_one_DAL
from stage_two_schema_transfer import stage_two_DAL
from stage_three_schema_transfer import stage_three_DAL




if __name__ == '__main__':
    print("BEGIN")
    init_schemas()
    DataSource(populate_calendar_data=True,
               populate_listings_data=True,
               populate_reviews_data=True)

    DataSource.populate()

    stage_one_DAL.insert_many()
    stage_two_DAL.insert_many()
    stage_three_DAL.insert_many()
