#%%

from sqlalchemy import create_engine
import pandas as pd
import os
#%%

# Define your connection parameters
server = 'servername'  # e.g., 'localhost' or 'myserver.database.windows.net'
database = 'database'
username = 'sa'
password = 'password'
driver = 'ODBC Driver 17 for SQL Server'  # Adjust if using a different driver

# Create the connection string
connection_string = f'mssql+pyodbc://{username}:{password}@{server}/{database}?driver={driver}'

# Create the engine
ENGINE = create_engine(connection_string)


def load_to_sql(folder):
    #%%
    for file in os.listdir(folder):
        path = f'{file}'
        try:
            df = pd.read_json(f'{folder}\\{path}', lines=True)
        except:
            df = pd.read_json(f'{folder}\\{path}')
        
        df.fillna('null')
        for column in df.columns:
            df[column] = df[column].astype('object')
    #%%
        table = file[:-5]
        print(f'Inserting data into {table}')
        df.to_sql(con=ENGINE, if_exists='replace',name=f'{table}', index=False)
        print(f'Table {table} inserted successfuly!')
     #%%



if __name__ == '__main__':
    load_to_sql('raw_data')
