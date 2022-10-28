output "instance_ip"   {
  value =  "${google_compute_instance.vm_instance[*].network_interface.0.access_config.0.nat_ip}"
  
}
output "port_number" {
    value = ":8080"
}
output "waiting_time" {
   value = "is 4min to install and 2min to apply ip over the browser"

}