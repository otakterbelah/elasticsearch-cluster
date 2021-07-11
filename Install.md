<p><l1>setting /etc/hosts</li></p>
<p><l1>192.168.1.165 kibana</li></p>
<p><l1>192.168.1.32 logstash</li></p>
<p><l1>192.168.1.33 elastic-master</li></p>
<p><l1>192.168.1.34 elastic-node1 </li></p>
<p><l1>192.168.1.35 elastic-node2 </li></p>

1. <b>install elasticsearch cluster</b>
-  download installelasticsearch.sh
-  wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/install-elasticsearch.sh 
-  chmod +x install-elasticsearch.sh
-  ./install-elasticsearch.sh
-  jalankan instalasi di node1 dan node2 mesin elasticsearch
-  kembali ke ke elastic master buat file instance.yml di folder /tmp nano /tmp/instance.yml atau download wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/instance.yml simpan pada folder /tmp
-  jalankan perintah bin/elasticsearch-certutil cert --keep-ca-key ca --pem --in /tmp/instance.yml --out /tmp/certs/certs.zip untuk membuat certifikat.
-  unzip file unzip certs.zip ada di folder /tmp/certs
-  buat folder certs mkdir /etc/elasticsearch/certs lakukan hal yang sama pada mesin node1 dan node2
-  buat folder yang sama di node1 dan node2 mkdir /etc/elasticsearch/certs
- copy file certificate master dan ca.crt di folder ca ke folder /etc/elasticsearch/certs
- copy semua certificate node1 dan node2 serta ca ke mesin node1 dan node2 ke folder /etc/elasticsearch/certs 
- backup file elasticsearch.ym dengan perintah mv /etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml.bak lakukan perintah yang sama pada node1 dan node2
- download file elasticsearch.yml master cd /etc/elasticsearch && wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/elasticsearch/master/elasticsearch.yml
- download elasticsearch node1 cd /etc/elasticsearch && wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/elasticsearch/node1/elasticsearch.yml
- download elasticsearch.yml node2 cd /etc/elasticsearch && https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/elasticsearch/node2/elasticsearch.yml
- start elasticsearch service systemctl start elasticsearch.service && systemctl status elasticsearch.service di seluruh node (node master,noode1,node2)
- buat password elasticsearch ketik perintah /usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive
- test cluster elasticsearch curl --cacert /etc/elasticsearch/certs/ca.crt -u elastic -XGET https://elastic-node1:9200/_cat/nodes?pretty
<img src="https://github.com/otakterbelah/elasticsearch-cluster/blob/main/Screenshot%20at%202021-07-11%2020-19-59.png"></img>
instalasi cluster elastic search telah selesai
2. <b> install kibana </b>
- download file kibana-install.sh wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/install-kibana.sh 
- chmod +x install-kibana.sh && ./install-kibana.sh
- backup file kibana default mv /etc/kibana/kibana.yml /etc/kibana/kibana.yml.bak
- download file kibana.yml cd /etc/kibana && wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/kibana/kibana.yml
- start kibana service<p>systemctl start kibana </p> <p>systemctl status kibana </p> <p>systemctl enable kibana</p> <p>systemctl status kibana</p>
- ketik perintah untuk membuat keystore /usr/share/kibana/bin/kibana-keystore create atau /usr/share/kibana/bin/kibana-keystore create --allow-root
- ketik perintah untuk memasukan user elastic /usr/share/kibana/bin/kibana-keystore add elasticsearch.username 
- ketik perintah untuk memasukan password elastic /usr/share/kibana/bin/kibana-keystore add elasticsearch.password
selesai instalasi kibana silahkan login masukan username dan password elasti yang di buat

3. <b>install logstash </b>
- download logstash-install.sh wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/install-logstash.sh
- chmod +x logsatsh-install.sh && ./logstash-install.sh
- backup file logstash.yml mv /etc/logstash/logstash.yml /etc/logstash.yml.bak
- download file logstash.yml cd /etc/logstash && wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/logstash/logstash.yml
- buka folder conf  cd conf download file logstash.conf wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/logstash/conf/logstash.conf
- start logstash service systemctl start logstash.service && systemctl status logstash.service && systemctl enable logstash.service
selesai install logstash

4. <b> install rsyslog dengan logstash </b>
disini mesn rsyslog telah terinstall jadi tinggal install logstash untuk kirim data ke elasticsearch
- download file kibana-install.sh wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/install-kibana.sh 
- chmod +x install-kibana.sh && ./install-kibana.sh
- buka folder conf.d di /etc/logstash/conf.d/
- download file rsyslog.conf wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/rsyslog/logstash/conf/rsyslog.conf
- buka folder rsyslog.conf cd /etc/rsyslog/rsyslog.conf download file 01-json-template.conf wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/rsyslog/rsyslog.conf/01-json-template.conf 
download file 60-output.conf wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/rsyslog/rsyslog.conf/60-output.conf
download file sudo wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/rsyslog/rsyslog.conf/sudo
- start logstash service systemctl start logstash.service && systemctl status logstash.service && systemctl enable logstash.service
- restart rsyslog service
- add di kibana dashboard index pattern rsyslog-prod*
selesai

