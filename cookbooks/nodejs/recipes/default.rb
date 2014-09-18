package "python-software-properties"
package "python"
package "g++"
package "make"

execute "add-apt-repository ppa:chris-lea/node.js" do
  user "root"
end

execute "apt-get update" do
  user "root"
end

package "nodejs"
