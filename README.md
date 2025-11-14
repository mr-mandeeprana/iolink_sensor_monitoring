
# 🚀 Mandeep Sensor Platform  
A complete IoT sensor analytics platform built using **Node-RED**, **Elasticsearch**, and **Kibana**.  

You can run this project in **Docker containers** or deploy the full system into a **Kubernetes cluster** (Docker Desktop Kubernetes supported out-of-the-box).

---

# 📌 Features

- ✔ Node-RED for IoT workflows  
- ✔ Elasticsearch for persistent time-series storage  
- ✔ Kibana dashboards for visualization  
- ✔ Docker + Kubernetes deployment included  
- ✔ Persistent Volumes (PVC) for data durability  
- ✔ Auto-starting services  
- ✔ Clean modular folder structure  

---

# 📁 Project Structure

```

mandeep-sensor-platform/
│
├── docker-compose.yml        # Docker-based deployment
├── Dockerfile                # Custom Node-RED image
├── entrypoint.sh             # Node-RED startup script
│
├── pvc.yaml                  # Docker PV mount (optional)
│
├── k8/                       # Kubernetes manifests
│   ├── elasticsearch-*.yaml
│   ├── kibana-*.yaml
│   ├── nodered-*.yaml
│
├── patch/                    # PVC/PV force delete fix
│   └── patch.json
│
├── data/                     # Local data storage (Docker)
├── bridge/                   # Extra config (MQTT, edge, etc.)
└── README.md

````

---

# 🐳 Running with Docker (Recommended for Development)

### 1️⃣ Start all services
```bash
docker compose up -d
````

### 2️⃣ Check running containers

```bash
docker ps
```

### 3️⃣ Access services

| Service       | URL                                            |
| ------------- | ---------------------------------------------- |
| Node-RED      | [http://localhost:1880](http://localhost:1880) |
| Elasticsearch | [http://localhost:9200](http://localhost:9200) |
| Kibana        | [http://localhost:5601](http://localhost:5601) |

### 4️⃣ Stop containers

```bash
docker compose down
```

---

# ☸ Running on Kubernetes (Docker Desktop Kubernetes)

### 1️⃣ Enable Kubernetes in Docker Desktop

Settings → Kubernetes → Enable → Apply

### 2️⃣ Deploy all manifests

```bash
cd k8
kubectl apply -f .
```

### 3️⃣ Check pods

```bash
kubectl get pods
```

Expected:

```
elasticsearch-xxxx   Running
kibana-xxxx          Running
nodered-xxxx         Running
```

### 4️⃣ Access services (NodePort)

| Service       | NodePort | URL                                              |
| ------------- | -------- | ------------------------------------------------ |
| Node-RED      | 30080    | [http://localhost:30080](http://localhost:30080) |
| Kibana        | 30081    | [http://localhost:30081](http://localhost:30081) |
| Elasticsearch | 30082    | [http://localhost:30082](http://localhost:30082) |

---

# 💾 Persistent Storage

Kubernetes PVCs:

```bash
kubectl get pvc
```

Your PVCs:

* `elasticsearch-pvc`
* `nodered-pvc`

Data remains across Pod restarts.

---

# 🧰 Troubleshooting: PVC stuck in *Terminating*

Use the included patch:

```
patch/patch.json
```

Contents:

```json
{
  "metadata": {
    "finalizers": []
  }
}
```

Apply fix:

```bash
kubectl patch pvc <PVC_NAME> --type=merge --patch-file patch/patch.json
kubectl patch pv <PV_NAME> --type=merge --patch-file patch/patch.json
```

Then delete normally:

```bash
kubectl delete pvc <PVC_NAME>
kubectl delete pv <PV_NAME>
```

---

# 🛠 Docker Image Details

Your custom Node-RED image:

* Loads flows from `/data`
* Runs via `entrypoint.sh`
* Installs additional npm modules on build
* Compatible with both Docker & Kubernetes

You can rebuild manually:

```bash
docker build -t mandeep-sensor-platform .
```

---

# 📊 Architecture Diagram

```
           ┌──────────────┐
 Sensors → │   Node-RED    │
           └───────┬──────┘
                   ▼
          ┌─────────────────┐
          │  Elasticsearch   │
          └────────┬────────┘
                   ▼
          ┌─────────────────┐
          │     Kibana      │
          └─────────────────┘
```

---

# 📌 When to Use What?

| Need                    | Use Docker | Use Kubernetes |
| ----------------------- | ---------- | -------------- |
| Simple local testing    | ✔          | ❌              |
| Auto-restart containers | ✔          | ✔              |
| Scaling services        | ❌          | ✔✔✔            |
| Production-ready        | ❌          | ✔✔✔✔✔          |
| Persistent cluster      | ❌          | ✔              |

---

# 📘 Future Enhancements

* MQTT integration
* Grafana + Prometheus for monitoring
* SSL + Ingress
* ARM64 support for Raspberry Pi
* Helm chart

---

# 👤 Author

**Mandeep Rana**
IoT Automation & Kubernetes Engineer

