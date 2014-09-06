sudo service httpd stop

sudo cp usr/my.cnf /usr/my.cnf
#sudo cp -r /etc/httpd/* etc/httpd/
sudo cp -r etc/nginx/* /etc/nginx/
sudo cp etc/supervisord.conf /etc/supervisord.conf
sudo cp etc/sysconfig/memcached /etc/sysconfig/memcached
sudo cp etc/sysctl.conf /etc/sysctl.conf


sudo service mysql restart
sudo service nginx restart
sudo service memcached restart
sudo service supervisord stop
sleep 2
sudo service supervisord start
sleep 4
sudo service supervisord status

