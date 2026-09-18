# Prometheus

## Docker Target

Configure the daemon

To configure the Docker daemon as a Prometheus target, you need to specify the metrics-address in the (/etc/docker/) daemon.json configuration file. This daemon expects the file to be located at one of the following locations by default. If the file doesn't exist, create it.

Add the following configuration:
```
{
  "metrics-addr": "127.0.0.1:9323"
}
```
