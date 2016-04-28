kdbg() {
   rand_name=$(date | shasum | cut -c1-5)
   kubectl run $rand_name -i --tty --image=672129611065.dkr.ecr.us-west-2.amazonaws.com/debug:v2
   kubectl delete deployment $rand_name
}

