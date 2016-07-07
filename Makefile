build:
	make -C alpine
	make -C ubuntu
	make -C chronograf
	make -C consul
	make -C grafana
	make -C haproxy
	make -C influxdb
	make -C kapacitor
	make -C redis
	make -C telegraf
	make -C vault
