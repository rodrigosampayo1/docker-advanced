# Comunicar contenedores de Docker entre sí

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
# Create a new container that it's linked 
docker run -it --rm --link mypostgres:postgresdb --name postgres_client postgres sh
###
# Connect to the database
psql -h postgresdb -U postgres mydb

# Launch a query
SELECT * FROM products;

# Docker ps form other terminal. You'll see you have two containers (mypostgress and mypostgress_client)
docker ps

# Exit postgress client
\q

# Exit container
exit

# Check your containers with docker ps again (mypostgress_client disappeared)
docker ps

# Delete mypostgres container
docker rm -f mypostgres

# Delete the volume
docker volume rm postgres-data