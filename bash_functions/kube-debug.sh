# Running `kubectl run ...` in order to spin up our debug container is pretty common. But it's a bit of a pain
# because you have to be sure that the generated deployment has a unique name, the command itself is pretty
# long, and you have to remember to clean up the deployment when you're done. This adds a simple bash function
# that generates a random name, spins up a debug container using that name and then, when you exit the 
# attache container it cleans up the deployment and pod.
kdbg() {
   rand_name=$(date | shasum | cut -c1-5)
   kubectl run $rand_name -i --tty --image=672129611065.dkr.ecr.us-west-2.amazonaws.com/debug:v2
   kubectl delete deployment $rand_name
}

