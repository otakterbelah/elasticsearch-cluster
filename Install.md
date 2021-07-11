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
-  jalankan instalasi di ketika mesin elastic search
-  kembali ke ke elastic master buat file instance.yml di folder /tmp nano /tmp/instance.yml atau download wget https://raw.githubusercontent.com/otakterbelah/elasticsearch-cluster/main/instance.yml simpan pada folder /tmp
-  jalankan perintah bin/elasticsearch-certutil cert --keep-ca-key ca --pem --in /tmp/instance.yml --out /tmp/certs/certs.zip untuk membuat certifikat.
-  unzip file unzip certs.zip ada di folder /tmp/certs
-  buat folder certs mkdir /etc/elasticsearch/certs lakukan hal yang sama pada mesin node1 dan node2
-  buat folder yang sama di node1 dan node2 mkdir /etc/elasticsearch/certs
- copy file certifikat master dan ca.crt di folder ca ke folder /etc/elasticsearch/certs
- copy semua certifikat node1 dan node2 serta ca ke mesin node1 dan node2 ke folder /etc/elasticsearch/certs 
- 
2. <b> install kibana </b>

3. <b>install logstash </b>

4. <b> install rsyslog dengan logstash </b>
