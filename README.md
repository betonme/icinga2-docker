# Icinga 2 Monitoring

Icinga 2 Monitoring solution all implemented in Docker.

## Getting Started

Icinga 2 in Docker is really easy to get started with. Clone the repo and follow the instructions below. This implementation relies heavily on docker compose in order to make standing the full application stack up very easy.

This implementation makes use of PostgreSQL database as well as InfluxDB for timeseries metrics. It also makes use of Icinga Web 2 for monitoring and Grafana for visualizing the timeseries data providing an excellent historic overview of the hosts and services you are monitoring.

As can be seen in the docker-compose file, many important directories have had Docker volumes mounted for them.

### Prerequisites

Icinga 2 in Docker requires the following to be installed first:

```
Git
Docker CE
Docker Compose
```

### Setup

Please read through the Dockerfiles and docker-compose file as well as the important section below fully so as to understand what is to be run.

Once you have cloned this repo simply follow the steps below:

```
git clone https://github.com/rpardamean/icinga2-docker.git
cd icinga2-docker
docker-compose up -d
```

Enter icingaweb2 container console and generate setup token
```
[root@icingaweb2 /]# icingacli setup token create
The newly generated setup token is: b9a60aa0d6226445
```

Then proceed to http://<docker-host-ip>:38080/icingaweb2/setup

  
  
  
### Important

Please note there are default passwords used in the Dockerfiles as well as the docker-compose file. Please adjust these accordingly before use.

## Tools and technlogies used  

* [Docker](https://www.docker.com/community-edition) - Container framework
* [Icinga 2](https://www.icinga.com/products/icinga-2/) - Complete monitoring solution
* [PostgreSQL](https://www.postgresql.org/) - Database used for Icinga 2
* [InfluxDB](https://www.influxdata.com/) - Timeseries database used for Icinga 2
* [Grafana](https://grafana.com/) - Visualization framework

## Authors

* **Robin O'Brien** - *Initial work* - [@robinjobrien](https://twitter.com/robinjobrien)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
