Pre requisiste: Login to AWS machine using command:
ssh -i "login-key.pem" ubuntu@ec2-35-91-173-239.us-west-2.compute.amazonaws.com

Do sudo -i to become root


Open jenkins at url: http://52.36.224.214:8080/
login admin/Password1
Token: http://52.36.224.214:8080/

Run build agent with arguments.

Step 1: Create Dockerfile, look for sampke Dockerfile.agent1

Step 2: Make an entry in Makefile for the build

Step 3: Run make, your agent name. If your dockerfile name is Dockefile.agent1, then you should run make agent1 and follow same for other. 

Step 4: Wait for the build to complete.

Step 5: Once the image is ready push the image to dockerhub. For this export on your system

export USER=<username>
export PASSWD=<PASSWORD>>

Step 6: Do a login to dockerhub by running make docker-login 

Step 7: Once login is run make deploy


Step 8: check on dockerhub that the image is pushed.