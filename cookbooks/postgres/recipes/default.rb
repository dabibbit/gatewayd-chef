package "libpq-dev"
package "postgresql"
package "postgresql-client"

execute "sudo -u postgres psql -U postgres -d postgres -c \"alter user postgres with password 'password';\""
execute "sudo -u postgres createdb ripple_gateway"

execute "sudo npm install -g pg"
execute "sudo npm install -g db-migrate"

