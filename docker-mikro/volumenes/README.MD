# Create a docker container with a volume assigned
docker run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data --name mypostgres postgres

# Access to that container
docker exec -it mypostgres sh

# Create a postgress db
createdb -U postgres mydb

# Access to my postgress db
psql -U postgres mydb

# Create a table
CREATE TABLE products (id int, name varchar(100));

# Create a product into my table
INSERT INTO products (id, name) VALUES (1, 'Wheel');

# Exit postgress client
\q

# Exit container
exit

# Delete mypostgres container
docker rm -f mypostgres

# Create a new container with the same volume attached
docker run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data --name mypostgres2 postgres

# Access to my new container
docker exec -it mypostgres2 sh

# Access to the existing database
psql -U postgres mydb

# Launch a query
SELECT * from products;
# Exit postgress client
\q
# Exit container
exit
# Delete the second container
docker rm -f mypostgres2
# Delete the volume
docker volume rm postgres-data