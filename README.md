# jupyter_hub_classroom
Google Cloud Jupyter Hub Classroom with Pytorch

Start you Google Cloud Console.
Make sure that the current project is "Payable"
https://cloud.google.com/billing/docs/how-to/modify-project

1. Run "push_pull_image.sh" or "build_docker_image.sh" (takes much longer, but you can customize)
2. Run "start_cluster.sh" to start cluster
  2.1. Edit this file to change settings
After a while you will get you jupyter hub running.

To terminate:
1. Run "stop_cluster.sh"
