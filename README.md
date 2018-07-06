# jupyter_hub_classroom
Google Cloud Jupyter Hub Classroom with Pytorch

Start you Google Cloud Console.
Make sure that the current project is "Payable"
https://cloud.google.com/billing/docs/how-to/modify-project

0. git clone https://github.com/kulikovv/jupyter_hub_classroom
1. cd jupyter_hub_classroom
2. touch config.yaml
3. nano config.yaml
```
hub:                                                                                              
  cookieSecret: "randomkey1"                       
proxy:                                                                                                  
  secretToken: "randomkey2"                         
singleuser:                                                                                               
  image:                                                                                                
    name: gcr.io/${your project name}/class-notebook                                                                            
    tag: latest   
```
4. Run "push_pull_image.sh" or "build_docker_image.sh" (takes much longer, but you can customize)
5. Run "start_cluster.sh" to start cluster
  2.1. Edit this file to change settings
After a while you will get you jupyter hub running.

To terminate:
1. Run "stop_cluster.sh"
