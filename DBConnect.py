import psycopg2

from config import config


class DatabaseConnection(object):

    def __init__(self):

        self._connection = None

        # read connection parameters
        params = config()

        # create connection to the PostgreSQL server
        self._connection = psycopg2.connect(**params)
        self._connection.autocommit = True  # persist changes to DB automatically

    def get_connection(self):
        return self._connection

    def __del__(self):

        if self._connection is not None:
            self._connection.close()