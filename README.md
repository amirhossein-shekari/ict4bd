# ICT4BD Dockerized Project

This project sets up a Jupyter Notebook environment with specific dependencies using Docker, Docker Compose and Energyplus.

## Features

- **Base Image**: Ubuntu 20.04
- **Installed Software**:
  - Python 3.8
  - Jupyter Notebook
  - TensorFlow 2.7.0
  - PyTorch 1.12.1
  - EnergyPlus 9.6.0
  - Additional Python packages as listed in `requirements.txt`

## Getting Started

These instructions will help you set up and run the project on your local machine.

### Prerequisites

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/)

### Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/amirhossein-shekari/ict4bd.git
   cd ict4bd

2. **Build and start the Docker container**:
   ```sh
   docker compose up --build
   
3. **Access Jupyter Notebook**:
   Open your browser and navigate to http://localhost:8888. Use the token provided in the terminal to log in.
   
5. **Stopping The Container**:
   To stop the running container, press Ctrl+C in the terminal where Docker Compose is running, or use:
   ```sh
   docker compose down

