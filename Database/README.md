# CONFIGURATION

Pre-requisites:

-Python3

-pip

In command prompt or Windows Powershell
1. Navigate to project directory

    ```
    cd .\Webpage\Databases
    ```

2. Configure PYTHONPATH. Set the PYTHONPATH to point to this project's directory.

    ```
    set PYTHONPATH="$PWD"
    ```

3. Create virtual environment

    ```
    python -m venv venv
    ```

4. Activate virtual environment

    ```
    venv/bin/activate
    ```

5. Install requirements to the virtual environment

    ```
    pip install -r requirements.txt
    ```

6. Create `database.ini` file inside the `db` directory with the following format

    ```
    [localhost]
    #REMOTE eecs connection
    database = <Your Database>
    user = <Your Username>
    password = <Your Password>
    host = web0.eecs.uottawa.ca
    port = 15432
    
    #LOCAL
    #database=postgres
    #host=localhost
    #port=5432

    [data_source_files]
    #Berlin Dataset
    Berlin_Calendar_Data=KaggleData\Berlin\calendar_summary.csv
    Berlin_Listings_Data=KaggleData\Berlin\listings.csv
    Berlin_Listings_Summary_Data=KaggleData\Berlin\listings_summary.csv
    Berlin_Neighbourhoods_Data=KaggleData\Berlin\neighbourhoods.csv
    Berlin_Reviews_Data=KaggleData\Berlin\reviews.csv
    Berlin_Reviews_Summary_Data=KaggleData\Berlin\reviews_summary.csv

    #Boston Dataset
    Boston_Calendar_Data=KaggleData\Boston\calendar.csv
    Boston_Listings_Data=KaggleData\Boston\listings.csv
    Boston_Reviews_Data=KaggleData\Boston\reviews.csv

    #Madrid Dataset
    Madrid_Calendar_Data=KaggleData\Madrid\calendar.csv
    Madrid_Listings_Data=KaggleData\Madrid\listings.csv
    Madrid_Listings_Summary_Data=KaggleData\Madrid\listings_detailed.csv
    Madrid_Neighbourhoods_Data=KaggleData\Madrid\neighbourhoods.csv
    Madrid_Reviews_Data=KaggleData\Madrid\reviews.csv
    Madrid_Reviews_Summary_Data=KaggleData\Madrid\reviews_detailed.csv

    #Melbourne Dataset
    Melbourne_Calendar_Data=KaggleData\Melbourne\calendar_dec18.csv
    Melbourne_Listings_Data=KaggleData\Melbourne\listings_dec18.csv
    Melbourne_Listings_Summary_Data=KaggleData\Melbourne\listings_summary_dec18.csv
    Melbourne_Neighbourhoods_Data=KaggleData\Melbourne\neighbourhoods.csv
    Melbourne_Reviews_Data=KaggleData\Melbourne\reviews_dec18.csv
    Melbourne_Reviews_Summary_Data=KaggleData\Melbourne\reviews_summary_dec18.csv

    #Seattle Dataset
    Seattle_Calendar_Data=KaggleData\Seattle\calendar.csv
    Seattle_Listings_Data=KaggleData\Seattle\listings.csv
    Seattle_Reviews_Data=KaggleData\Seattle\reviews.csv
    ```
    
7. Run Application

    ```
    python main.py
    ```