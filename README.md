# DevOps Engineer Assignment-2 Submission
## Introduction
Welcome to my submission for the DevOps Engineer assignment -2. In this repository, you'll find all the necessary files and documentation related to the assignment requirements.

## Assignment Description 

To prepare the provided Node.js codebase for deployment on a local Kubernetes cluster, I followed the following several steps:
### First, Download the source code & Unzip the folder in your local machine
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/030dc0d8-fa14-4817-b110-ea510ebb16a8)

### Second, Dockerize the Node.js Application: 
#### Dockerizing your application involves creating a Docker image that contains your Node.js application along with its dependencies. 
#### Now I'll be able to run my application in containers, which can then be deployed to Kubernetes.
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/3e5443bf-14f3-48b9-b626-b31e27d54cc9)

#### Adiitionaly we can use :-
#### docker build -t hello-node-image .
to build docker image 
![image](https://github.com/vaibhavmalhotra002/hello-node/assets/76607940/abaeb716-bb48-440b-b9b5-d499b4c0709a)

#### Next use:- docker run -p 3000:3000 hello-node-image
This command maps port 3000 of the container to port 3000 of your localhost. Now we can access our Node.js application at http://localhost:3000 to check our docker image is working fine or not.
![image](https://github.com/vaibhavmalhotra002/hello-node/assets/76607940/eb9a5cb9-615d-40f2-9efc-cc53537f6fa9)

### Third, Create Kubernetes Deployment and Service YAML files
You'll need to create YAML files for Deployment and Service.
Deployment YAML will specify how many instances of your application should run,
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/dfcb573f-02d3-4bbe-bb11-206d8756229e)

while Service YAML will expose your application to other services within the Kubernetes cluster.
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/a7123700-ec2b-4cdd-bcda-21a60452de64)

### Deploy to Kubernetes
Make sure you have a local Kubernetes cluster(in my case Minikube) set up & running in the background, then you can deploy your application using kubectl:
Run the commands
## kubectl apply -f deployment.yaml
## kubectl apply -f service.yaml

### After executing these commands, your Node.js application should be deployed to your local Kubernetes cluster.

Note:- Make sure to adjust configurations as per your requirements and your Kubernetes cluster setup.

### Fourth, To implement Horizontal Pod Autoscaling (HPA) for the deployed application, you'll need to configure HPA in addition to the Deployment and Service configurations. Here's how I did this:
1. Enable Metrics Server
Horizontal Pod Autoscaler requires metrics from the Metrics Server to function properly. Ensure that the Metrics Server is deployed and running in your Kubernetes cluster.
If not installed, install using:- kubectl apply-f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/c10bbeb6-46a3-47e9-a748-aa21bf67d58c)

2. Update Deployment YAML
Update your Deployment YAML file to include resource requests and limits for CPU and memory. This will allow Kubernetes to monitor my resource usage.
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/d641e13b-e9a8-4513-a8d7-9c337875ae3a)

3. Create Horizontal Pod Autoscaler (HPA) YAML
Create an HPA YAML file to define the autoscaling behavior.
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/d03e2ea9-4151-4d04-bad3-a0b6e270a104)

4. Apply Changes
Apply the changes to your Kubernetes cluster using kubectl apply:

kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

kubectl apply -f hpa.yaml

### Fifth, To define resource limitations (CPU and RAM) for the deployed application pods, we need to set resource requests and limits in the Deployment YAML file. 
This will allow Kubernetes to allocate resources appropriately and prevent resource starvation or contention.

Here's how I specifed resource limitations in my Deployment YAML:
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/d641e13b-e9a8-4513-a8d7-9c337875ae3a)
In this configuration:

requests specify the minimum amount of resources that the container requires. &
limits specify the maximum amount of resources that the container is allowed to use.

### After updating the Deployment YAML with resource limitations, you can apply the changes to your Kubernetes cluster:

## kubectl apply -f deployment.yaml
 This ensures that each pod running my Node.js application works to the specified resource limitations, preventing resource contention and ensuring stable performance of my 
 application.

### Sixth, To simulate increased traffic and stress test my application using hey (a load testing tool), I followed these steps:

1. Install hey
First if haven't already, you need to install hey. You can find installation instructions in the hey GitHub repository: https://github.com/rakyll/hey#install
I have a mac with homebrew installed so I installed it easily using  brew install hey.

2. Determine Load Parameters
Decide on the load parameters you want to simulate, such as the number of requests (-n), the concurrency level (-c), and any additional options you want to use.

3. Run Load Test
Run hey with the desired parameters to stress test your application. For example:
I ran using :-

hey -n 1000 -c 50 http://your-nodejs-app-url/
This command sends 1000 requests with a concurrency level of 50 to the specified URL.(in my case it's http://localhost:3000/ )
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/e7cd52fa-5867-4066-bf26-a04222bcb51b)

4. Analyze Results
Once the load test completes, hey will display various metrics such as requests per second, latency statistics, and errors encountered. Analyze these metrics to understand how your application performs under load.

Example Load Test
Here's another example of a load test command using hey:

hey -n 2000 -c 150 http://localhost:3000/
& Observe how it responds
![image](https://github.com/vaibhavmalhotra002/Devops_Assi_2/assets/76607940/85f30f87-815f-4a8f-9969-484943f042a6)
-n 2000: Specifies 2000 total requests to be made.
-c 150: Sets the concurrency level to 150, meaning 150 requests will be made concurrently.

You can adjust the parameters according to your specific testing requirements and the expected traffic load on your application.













