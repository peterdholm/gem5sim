
export GOOGLE_APPLICATION_CREDENTIALS="/Users/peterholm/hardy-clover-324620-a7ebee7e97ea.json"

gcloud auth login
#mkdir -p terraform-gem5sim
#cp -f make_vm.tf terraform-gem5sim
#pushd terraform-gem5sim
terraform init
terraform plan
terraform apply
#popd
gcloud compute ssh --project=hardy-clover-324620 --zone=us-central1-a gem5sim
