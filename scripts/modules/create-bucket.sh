create_bucket() {
	print_yellow "\nCreating Storage bucket to store instance start up scripts"

	if gcloud storage buckets describe gs://${BUCKET_ID} &>/dev/null; then
		print_green "Storage bucket $BUCKET_ID already exists."
	else
		gcloud storage buckets create gs://${BUCKET_ID} --location=${REGION} || {
			print_red "Error creating storage bucket. Please check for errors."
			exit 1
		}
		print_green "Created storage bucket: $BUCKET_ID"
	fi
}
