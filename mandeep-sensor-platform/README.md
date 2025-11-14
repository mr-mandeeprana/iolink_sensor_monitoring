
# 🛰️ Mandeep Sensor Platform

A scalable IoT sensor data platform built using **Node-RED**, **Elasticsearch**, and **Kibana** for data collection, storage, and visualization.

---

## 🧱 Architecture

```

+--------------------+        +---------------------+        +----------------------+
|     Node-RED       | -----> |   Elasticsearch     | -----> |       Kibana         |
| (Data Collection)  |        | (Data Storage/Index)|        | (Data Visualization) |
+--------------------+        +---------------------+        +----------------------+

```

- **Node-RED**: Handles sensor input and data flow logic.
- **Elasticsearch**: Stores structured sensor data for analytics.
- **Kibana**: Provides dashboards and visualization for stored data.

---

## 🚀 Features

- Real-time sensor data ingestion via Node-RED.
- Centralized logging and search powered by Elasticsearch.
- Interactive dashboards and analytics via Kibana.
- Containerized deployment using Docker or Kubernetes.

---

## 🧩 Project Structure

```

mandeep-sensor-platform/
├── sensor-platform/
│   ├── Dockerfile                  # Node-RED container definition
│   ├── docker-compose.yml          # Docker Compose file for full stack
│   ├── flows.json                  # Node-RED flow configuration
│   └── k8/
│       ├── elasticsearch-deployment.yml
│       ├── kibana-deployment.yml
│       ├── nodered-deployment.yml
│       └── nodered-service.yml
└── README.md                       # This file

````

---

## 🐳 Docker Deployment

### 1. Build the image
```bash
docker build -t mandeep/sensor-platform:latest .
````

### 2. Run the stack

```bash
docker-compose up -d
```

### 3. Access the services

| Service       | URL                                            |
| ------------- | ---------------------------------------------- |
| Node-RED      | [http://localhost:1880](http://localhost:1880) |
| Elasticsearch | [http://localhost:9200](http://localhost:9200) |
| Kibana        | [http://localhost:5601](http://localhost:5601) |

---

## ☸️ Kubernetes Deployment

### 1. Apply the manifests

From the `sensor-platform/k8` directory:

```bash
kubectl apply -f elasticsearch-deployment.yml
kubectl apply -f kibana-deployment.yml
kubectl apply -f nodered-deployment.yml
kubectl apply -f nodered-service.yml
```

### 2. Verify running pods

```bash
kubectl get pods
```

### 3. Access Node-RED

If using Minikube:

```bash
minikube service nodered-service
```

---

## ⚙️ Configuration

* The Node-RED flows are stored in `flows.json`.
* Elasticsearch and Kibana are configured with default settings.
* You can modify the ports and environment variables in `docker-compose.yml` or Kubernetes YAML files.

---

## 📦 Docker Hub Integration

If you want to push your image to Docker Hub:

```bash
docker login
docker tag mandeep/sensor-platform:latest mandeeprana1/sensor-platform:latest
docker push mandeeprana1/sensor-platform:latest
```

---

## 🧠 Future Enhancements

* Add MQTT or HTTP-based sensor data ingestion.
* Secure the stack with authentication (Elastic Security / OAuth).
* Add persistent storage (PVCs in Kubernetes).
* Deploy dashboards automatically in Kibana.

---

## 👨‍💻 Author

**Mandeep Rana**
🔗 GitHub: [mandeeprana1](https://github.com/mandeeprana1)
📧 Email: *[Mail](mailto:mr.mandeeprana52@gmail.com)

---

## 📝 License

This project is licensed under the MIT License — feel free to use and modify.
```
